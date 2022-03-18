package com.edmi.project.controller;

import com.edmi.project.myclass.*;
import com.edmi.project.repository.*;
import com.edmi.project.service.EmailSenderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.URLConnection;
import java.util.List;
import java.util.Optional;

@Controller
public class ManagerThesisController {
    @Autowired
    ManagerOfCandidateRepository managerOfCandidateRepository;
    @Autowired
    List<ManagerOfCandidate> managerOfCandidates;
    @Autowired
    List<ManagerOfCandidate> managerOfCandidatesAccepted;
    @Autowired
    ManagerThesis managerThesis;
    @Autowired
    CandidateIdentifierRepository candidateIdentifierRepository;
    @Autowired
    List<CandidateIdentifier> candidateIdentifierList;
    @Autowired
    List<CandidateIdentifier> candidateIdentifierListAccepted;
    @Autowired
    Optional<CandidateIdentifier> candidateIdentifierTemp;
    @Autowired
    Optional<CandidateIdentifier> candidateIdentifierTempAccepted;

    @RequestMapping("dashboardManagerThesis")
    public ModelAndView dashboardManagerThesis(HttpSession session, HttpServletResponse response)
    {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        if (session.getAttribute("managerThesis")==null){
            return new ModelAndView("redirect:loginPersonnel");
        }
        candidateIdentifierList.clear();
        managerOfCandidates.clear();
        session.removeAttribute("candidateIdentifierList");
        managerThesis=(ManagerThesis)session.getAttribute("managerThesis");
        managerOfCandidates=managerOfCandidateRepository.findByIdManagerAndDecision(managerThesis.getId(),false);
        for (int i=0;i<managerOfCandidates.size();i++)
        {
                candidateIdentifierTemp=candidateIdentifierRepository.findById(managerOfCandidates.get(i).getIdCandidate());
                candidateIdentifierList.add(candidateIdentifierTemp.get());
        }
        session.setAttribute("managerOfCandidates",managerOfCandidates);
        session.setAttribute("candidateIdentifierList",candidateIdentifierList);
        managerOfCandidatesAccepted.clear();
        candidateIdentifierListAccepted.clear();
        managerOfCandidatesAccepted=managerOfCandidateRepository.findByIdManagerAndDecision(managerThesis.getId(),true);
        for (int i=0;i<managerOfCandidatesAccepted.size();i++)
        {
            candidateIdentifierTempAccepted=candidateIdentifierRepository.findById(managerOfCandidatesAccepted.get(i).getIdCandidate());
            candidateIdentifierListAccepted.add(candidateIdentifierTempAccepted.get());
        }
        session.setAttribute("candidateIdentifierListAccepted",candidateIdentifierListAccepted);
        return new ModelAndView("dashboardManagerThesis.jsp");
    }
    @Autowired
    private EmailSenderService emailSenderService;
    @Autowired
    ManagerOfCandidate managerOfCandidateValid;
    @RequestMapping("validManagerThesis")
    public ModelAndView validManagerThesis(HttpSession session, HttpServletResponse response,HttpServletRequest request,Long id_candidate)
    {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        if (session.getAttribute("managerThesis")==null){
            return new ModelAndView("redirect:loginPersonnel");
        }
        try {
            id_candidate = Long.parseLong(request.getParameter("id_candidate"));
            if (id_candidate == 0) {
                return new ModelAndView("redirect:dashboardManagerThesis");
            }
        }catch (Exception e)
        {
            return new ModelAndView("redirect:dashboardManagerThesis");
        }
        managerOfCandidateValid=managerOfCandidateRepository.findByIdCandidate(id_candidate);
        managerOfCandidateValid.setDecision(true);
        managerOfCandidateRepository.save(managerOfCandidateValid);
        candidateIdentifier=candidateIdentifierRepository.findById(id_candidate);
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setTo(candidateIdentifier.get().getEmail());
        mailMessage.setSubject("Suite à votre Demande à l'EDMI");
        mailMessage.setFrom("no-reply@edmi.ucad.sn");
        mailMessage.setText("Bonjour  "+ candidateIdentifier.get().getName()+" "+ candidateIdentifier.get().getSurname()
                +"\n\n\nVotre directeur de thèse vous a donné un avis favorable.\nMerci de vous connecter régulièrement\n\n\n\n\n ce message est automatique merci de ne pas répondre");

        emailSenderService.sendEmail(mailMessage);
        return new ModelAndView("redirect:dashboardManagerThesis");
    }
    @Autowired
    CandidateUniversityCurriculumFormRepository candidateUniversityCurriculumFormRepository;
    @Autowired
    PhdSoughtFormRepository phdSoughtFormRepository;
    @Autowired
    CandidateIdentifierFormRepository candidateIdentifierFormRepository;
    @Autowired
    CotutellePhdFormRepository cotutellePhdFormRepository;
    @Autowired
    Optional<CandidateIdentifier> candidateIdentifierNoValid;
    @RequestMapping("noValidManagerThesis")
    public ModelAndView noValidManagerThesis(HttpSession session, HttpServletResponse response,HttpServletRequest request,Long id_candidate) {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        if (session.getAttribute("managerThesis") == null) {
            return new ModelAndView("redirect:loginPersonnel");
        }
        try {
            id_candidate = Long.parseLong(request.getParameter("id_candidate"));
            if (id_candidate == 0) {
                return new ModelAndView("redirect:dashboardManagerThesis");
            }
        } catch (Exception e) {
            return new ModelAndView("redirect:dashboardManagerThesis");
        }
        candidateIdentifierNoValid=candidateIdentifierRepository.findById(id_candidate);
        candidateIdentifierRepository.deleteById(id_candidate);
        candidateUniversityCurriculumFormRepository.deleteById(id_candidate);
        cotutellePhdFormRepository.deleteById(id_candidate);
        phdSoughtFormRepository.deleteById(id_candidate);
        candidateIdentifierFormRepository.deleteById(id_candidate);
        ManagerOfCandidate managerOfCandidate=managerOfCandidateRepository.findByIdCandidate(id_candidate);
        managerOfCandidate.setIdManager(0L);
        managerOfCandidateRepository.save(managerOfCandidate);
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setTo(candidateIdentifierNoValid.get().getEmail());
        mailMessage.setSubject("Suite à votre Demande à l'EDMI");
        mailMessage.setFrom("no-reply@edmi.ucad.sn");
        mailMessage.setText("Bonjour  "+ candidateIdentifierNoValid.get().getName()+" "+ candidateIdentifierNoValid.get().getSurname()
                +"\n\n\nVotre directeur de thèse vous a donné un avis défavorable.\nDonc on ne pourra donner suite à votre demande.\n\n\n\n\n ce message est automatique merci de ne pas répondre");

        emailSenderService.sendEmail(mailMessage);

        return new ModelAndView("dashboardManagerThesis.jsp");
    }
    @RequestMapping("cv")
    public ModelAndView cv(HttpServletResponse response,HttpSession session,HttpServletRequest request) throws IOException {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        if (session.getAttribute("managerThesis")==null&&session.getAttribute("managerLaboratory")==null&&session.getAttribute("managerPhd")==null&&session.getAttribute("directorEdmi")==null&&session.getAttribute("headInstitution")==null)
        {
            return new ModelAndView("redirect:loginPersonnel");
        }
        Long id_candidate;
        try {
            id_candidate = Long.parseLong(request.getParameter("id_candidate"));
            if (id_candidate == 0) {
                return new ModelAndView("redirect:dashboardManagerThesis");
            }
        }catch (Exception e)
        {
            return new ModelAndView("redirect:dashboardManagerThesis");
        }
        File file=new File("fileCandidate/"+id_candidate+"/Cv.pdf");
        if (file.exists()) {
            String mimeType = URLConnection.guessContentTypeFromName(file.getName());
            if (mimeType == null) {
                mimeType = "application/octet-stream";
            }

            response.setContentType(mimeType);

            response.setHeader("Content-Disposition", String.format("inline; filename=\"" + file.getName() + "\""));

            response.setContentLength((int) file.length());

            InputStream inputStream = new BufferedInputStream(new FileInputStream(file));

            FileCopyUtils.copy(inputStream, response.getOutputStream());

        }
        else {
            dashboardManagerThesis(session,response);
        }
        return new ModelAndView("redirect:loginPersonnel");
    }

    @RequestMapping("project")
    public ModelAndView project(HttpServletResponse response,HttpSession session,HttpServletRequest request) throws IOException {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        if (session.getAttribute("managerThesis")==null&&session.getAttribute("managerLaboratory")==null&&session.getAttribute("managerPhd")==null&&session.getAttribute("directorEdmi")==null&&session.getAttribute("headInstitution")==null)
        {
            return new ModelAndView("redirect:loginPersonnel");
        }
        Long id_candidate;
        try {
            id_candidate = Long.parseLong(request.getParameter("id_candidate"));
            if (id_candidate == 0) {
                return new ModelAndView("redirect:loginPersonnel");
            }
        }catch (Exception e)
        {
            return new ModelAndView("redirect:loginPersonnel");
        }
        File file=new File("fileCandidate/"+id_candidate+"/Project.pdf");
        if (file.exists()) {
            String mimeType = URLConnection.guessContentTypeFromName(file.getName());
            if (mimeType == null) {
                mimeType = "application/octet-stream";
            }

            response.setContentType(mimeType);

            response.setHeader("Content-Disposition", String.format("inline; filename=\"" + file.getName() + "\""));

            response.setContentLength((int) file.length());

            InputStream inputStream = new BufferedInputStream(new FileInputStream(file));

            FileCopyUtils.copy(inputStream, response.getOutputStream());

        }
        else {
            dashboardManagerThesis(session,response);
        }
        return new ModelAndView("redirect:loginPersonnel");
    }
    @RequestMapping("scholarship")
    public ModelAndView scholarship(HttpServletResponse response,HttpSession session,HttpServletRequest request) throws IOException {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        if (session.getAttribute("managerThesis")==null&&session.getAttribute("managerLaboratory")==null&&session.getAttribute("managerPhd")==null&&session.getAttribute("directorEdmi")==null&&session.getAttribute("headInstitution")==null)
        {
            return new ModelAndView("redirect:loginPersonnel");
        }
        Long id_candidate;
        try {
            id_candidate = Long.parseLong(request.getParameter("id_candidate"));
            if (id_candidate == 0) {
                return new ModelAndView("redirect:loginPersonnel");
            }
        }catch (Exception e)
        {
            return new ModelAndView("redirect:loginPersonnel");
        }
        File file=new File("fileCandidate/"+id_candidate+"/Scholarship.pdf");
        if (file.exists()) {
            String mimeType = URLConnection.guessContentTypeFromName(file.getName());
            if (mimeType == null) {
                mimeType = "application/octet-stream";
            }

            response.setContentType(mimeType);

            response.setHeader("Content-Disposition", String.format("inline; filename=\"" + file.getName() + "\""));

            response.setContentLength((int) file.length());

            InputStream inputStream = new BufferedInputStream(new FileInputStream(file));

            FileCopyUtils.copy(inputStream, response.getOutputStream());

        }
        else {
            dashboardManagerThesis(session,response);
        }
        return new ModelAndView("redirect:loginPersonnel");
    }
    @RequestMapping("agreement")
    public ModelAndView agreement(HttpServletResponse response,HttpSession session,HttpServletRequest request) throws IOException {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        if (session.getAttribute("managerThesis")==null&&session.getAttribute("managerLaboratory")==null&&session.getAttribute("managerPhd")==null&&session.getAttribute("directorEdmi")==null&&session.getAttribute("headInstitution")==null)
        {
            return new ModelAndView("redirect:loginPersonnel");
        }
        Long id_candidate;
        try {
            id_candidate = Long.parseLong(request.getParameter("id_candidate"));
            if (id_candidate == 0) {
                return new ModelAndView("redirect:loginPersonnel");
            }
        }catch (Exception e)
        {
            return new ModelAndView("redirect:loginPersonnel");
        }
        File file=new File("fileCandidate/"+id_candidate+"/Agreement.pdf");
        if (file.exists()) {
            String mimeType = URLConnection.guessContentTypeFromName(file.getName());
            if (mimeType == null) {
                mimeType = "application/octet-stream";
            }

            response.setContentType(mimeType);

            response.setHeader("Content-Disposition", String.format("inline; filename=\"" + file.getName() + "\""));

            response.setContentLength((int) file.length());

            InputStream inputStream = new BufferedInputStream(new FileInputStream(file));

            FileCopyUtils.copy(inputStream, response.getOutputStream());

        }
        else {
            dashboardManagerThesis(session,response);
        }
        return new ModelAndView("redirect:loginPersonnel");
    }
    @Autowired
    Optional<CandidateIdentifier> candidateIdentifier;
    @Autowired
    List<CandidateIdentifier> candidateIdentifierTempo;
    @RequestMapping("formCandidateForPersonnel")
    public ModelAndView formCandidateForPersonnel(HttpSession session,HttpServletResponse response,HttpServletRequest request)
    {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        if (session.getAttribute("managerThesis")==null&&session.getAttribute("managerLaboratory")==null&&session.getAttribute("managerPhd")==null&&session.getAttribute("directorEdmi")==null&&session.getAttribute("headInstitution")==null)
        {
            return new ModelAndView("redirect:loginPersonnel");
        }
        Long id_candidate;
        try {
            id_candidate = Long.parseLong(request.getParameter("id_candidate"));
            if (id_candidate == 0) {
                return new ModelAndView("redirect:loginPersonnel");
            }
        }catch (Exception e)
        {
            return new ModelAndView("redirect:loginPersonnel");
        }
        candidateIdentifier=candidateIdentifierRepository.findById(id_candidate);
        candidateIdentifierTempo.clear();
        candidateIdentifierTempo.add(candidateIdentifier.get());
        session.setAttribute("candidateIdentifier",candidateIdentifierTempo);
        return new ModelAndView("redirect:/formCandidate");
    }
}
