package com.edmi.project.controller;

import com.edmi.project.myclass.*;
import com.edmi.project.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.edmi.project.service.EmailSenderService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

@Controller
public class HomeCandidateController
{
    @Autowired
    CandidateIdentifierForm candidateIdentifierForm;
    @Autowired
    CandidateUniversityCurriculumForm candidateUniversityCurriculumForm;
    @Autowired
    CandidateUniversityCurriculumFormRepository candidateUniversityCurriculumFormRepository;
    @Autowired
    CandidateIdentifierFormRepository candidateIdentifierFormRepository;//We will use it to verify if candidate is in Database to mask the form in view
    @RequestMapping("homeCandidate")
    public ModelAndView homeCandidate(HttpSession session, HttpServletResponse response)
    {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        ModelAndView mv=new ModelAndView();
        List<CandidateIdentifier> candidateIdentifier=null;
        try {
            candidateIdentifier= (List<CandidateIdentifier>) session.getAttribute("candidateIdentifier");
        }
        catch (Exception e)
        {
            session.removeAttribute("candidateIdentifier");
            homeCandidate(session,response);
        }

        if (candidateIdentifier!=null)
        {
            Long checkIdForPage=candidateIdentifier.get(0).getId();
            if(candidateIdentifierFormRepository.existsById(checkIdForPage)) {
                mv.addObject("Status", "dashboard");
                mv.setViewName("redirect:/dashboardCandidate");
            }
            else {
                mv.addObject("Status", "connexion");
                mv.setViewName("homeCandidate.jsp");
            }
        }
        else{
            mv.setViewName("redirect:/loginCandidate");
        }
        return mv;
    }
    @Autowired
    FileCandidateRepository fileCandidateRepository;
    @Autowired
    FileCandidate fileCandidate;
    @Autowired
    ManagerThesisRepository managerThesisRepository;
    @Autowired
    List<ManagerThesis> listManagerThesis;
    @Autowired
    PhdSoughtFormRepository phdSoughtFormRepository;
    @Autowired
    PhdSoughtForm phdSoughtForm;
    @Autowired
    ManagerOfCandidateRepository managerOfCandidateRepository;
    @RequestMapping("dashboardCandidate")
    public ModelAndView dashboard(HttpSession session, HttpServletResponse response)
    {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        ModelAndView mv= new  ModelAndView();

        List<CandidateIdentifier> candidateIdentifier= (List<CandidateIdentifier>) session.getAttribute("candidateIdentifier");
        if (candidateIdentifier!=null)
        {
            Long checkIdForPage=candidateIdentifier.get(0).getId();
            if (fileCandidateRepository.existsById(checkIdForPage))
            {
                session.setAttribute("fileStatus","valid");
            }
            else {
                session.setAttribute("fileStatus","noValid");
            }
            if (candidateIdentifier.get(0).getSubmit())
            {
                phdSoughtForm=phdSoughtFormRepository.findById(checkIdForPage).orElse(null);
                listManagerThesis=managerThesisRepository.findByLaboratory(phdSoughtForm.getNameAddressLaboratory());
                if (managerOfCandidateRepository.existsByIdCandidate(checkIdForPage))
                {
                    session.setAttribute("managerExist","valid");
                }
                else {
                    session.setAttribute("managerExist","no valid");
                }
                session.setAttribute("candidateSubmit","valid");
                session.setAttribute("listManagerThesis",listManagerThesis);
            }
            else {
                session.setAttribute("candidateSubmit","no valid");
            }
            candidateIdentifierForm=candidateIdentifierFormRepository.findById(checkIdForPage).orElse(null);
            candidateUniversityCurriculumForm=candidateUniversityCurriculumFormRepository.findById(checkIdForPage).orElse(null);
            mv.addObject("candidateIdentifierForm",candidateIdentifierForm);
            mv.addObject("candidateUniversityCurriculumForm",candidateUniversityCurriculumForm);
            mv.setViewName("dashboardCandidate.jsp");
        }
        else {
            mv.setViewName("loginCandidate.jsp");
        }
        return mv;
    }
    @Autowired
    CotutellePhdFormRepository cotutellePhdFormRepository;
    @Autowired
    List<CandidateIdentifier> candidateIdentifier;
    @Autowired
    CotutellePhdForm cotutellePhdForm;
    @RequestMapping("homeCandidateForm")
    public ModelAndView homeCandidateForm(HttpServletRequest request,HttpSession session, HttpServletResponse response) throws IOException
    {
        if (session.getAttribute("candidateIdentifier")==null)
        {
            return new ModelAndView("redirect:/loginCandidate");
        }

        candidateIdentifier= (List<CandidateIdentifier>) session.getAttribute("candidateIdentifier");
        CandidateIdentifier candidateIdentifierFirstElement=candidateIdentifier.get(0);
        candidateIdentifierForm.setId(candidateIdentifierFirstElement.getId());
        candidateIdentifierForm.setHomeAddress(request.getParameter("homeAddress"));
        candidateIdentifierForm.setNameWife(request.getParameter("nameWife"));
        candidateIdentifierForm.setName(candidateIdentifierFirstElement.getName());
        candidateIdentifierForm.setSurname(candidateIdentifierFirstElement.getSurname());
        candidateIdentifierForm.setEmail(candidateIdentifierFirstElement.getEmail());
        candidateIdentifierForm.setPhoneNumber(request.getParameter("phoneNumber"));

        candidateUniversityCurriculumForm.setId(candidateIdentifierFirstElement.getId());
        candidateUniversityCurriculumForm.setAccessDiploma(request.getParameter("accessDiploma"));
        candidateUniversityCurriculumForm.setSpeciality(request.getParameter("speciality"));
        candidateUniversityCurriculumForm.setUniversity(request.getParameter("university"));
        candidateUniversityCurriculumForm.setCountry(request.getParameter("country"));
        candidateUniversityCurriculumForm.setDateDiploma(request.getParameter("dateDiploma"));
        candidateUniversityCurriculumForm.setPlaceDiploma(request.getParameter("placeDiploma"));
        candidateUniversityCurriculumForm.setMention(request.getParameter("mention"));

        phdSoughtForm.setId(candidateIdentifierFirstElement.getId());
        phdSoughtForm.setEntitled(request.getParameter("entitled"));
        phdSoughtForm.setInstitute(request.getParameter("institute"));
        phdSoughtForm.setTopicPhd(request.getParameter("topicPhd"));
        phdSoughtForm.setNameAddressLaboratory(request.getParameter("nameAddressLaboratory"));

        cotutellePhdForm.setId(candidateIdentifierFirstElement.getId());
        cotutellePhdForm.setNameAddressUniversity(request.getParameter("nameAddressUniversity"));
        cotutellePhdForm.setNameSurnameManagerFormation(request.getParameter("nameSurnameManagerFormation"));
        cotutellePhdForm.setNameSurnameManagerThesis(request.getParameter("nameSurnameManagerThesis"));


        try{
        candidateIdentifierFormRepository.save(candidateIdentifierForm);
        candidateUniversityCurriculumFormRepository.save(candidateUniversityCurriculumForm);
        cotutellePhdFormRepository.save(cotutellePhdForm);
        phdSoughtFormRepository.save(phdSoughtForm);}
        catch (Exception e) {
            System.out.println(e);
    }
        return new ModelAndView("redirect:/dashboardCandidate");
    }
    /*@RequestMapping("uploadFile")
    public ModelAndView uploadFile(HttpSession session, HttpServletResponse response)
    {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        ModelAndView mv=new ModelAndView();
        List<CandidateIdentifier> candidateIdentifier= (List<CandidateIdentifier>) session.getAttribute("candidateIdentifier");
        if (candidateIdentifier!=null)
        {
            mv.setViewName("uploadFile.jsp");

        }
        else{
            mv.setViewName("redirect:/loginCandidate");
        }
        return mv;
    }*/
    @RequestMapping("formCandidate")
    public ModelAndView formCandidate(HttpSession session,HttpServletResponse response)
    {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        ModelAndView mv=new ModelAndView("formCandidate.jsp");
        Optional<CandidateIdentifierForm> candidateIdentifierForm;
        Optional<CandidateUniversityCurriculumForm> candidateUniversityCurriculumForm;
        Optional<CotutellePhdForm> cotutellePhdForm;
        Optional<PhdSoughtForm> phdSoughtForm;
        List<CandidateIdentifier> candidateIdentifier= (List<CandidateIdentifier>) session.getAttribute("candidateIdentifier");
        if (session.getAttribute("candidateIdentifier")==null)
        {
            return new ModelAndView("redirect:/loginCandidate");
        }
        Long checkIdForPage=candidateIdentifier.get(0).getId();
        candidateIdentifierForm=candidateIdentifierFormRepository.findById(checkIdForPage);
        candidateUniversityCurriculumForm=candidateUniversityCurriculumFormRepository.findById(checkIdForPage);
        cotutellePhdForm=cotutellePhdFormRepository.findById(checkIdForPage);
        phdSoughtForm=phdSoughtFormRepository.findById(checkIdForPage);
        session.setAttribute("candidateIdentifierForm",candidateIdentifierForm);
        session.setAttribute("candidateUniversityCurriculumForm",candidateUniversityCurriculumForm);
        session.setAttribute("phdSoughtForm",phdSoughtForm);
        session.setAttribute("cotutellePhdForm",cotutellePhdForm);
        return mv;
    }
    @Autowired
    CandidateIdentifierRepository candidateIdentifierRepository;
    @RequestMapping("submitCandidate")
    public ModelAndView submitCandidate(HttpSession session,HttpServletResponse response) throws IOException {
        try {
            candidateIdentifier= (List<CandidateIdentifier>) session.getAttribute("candidateIdentifier");
        }
        catch (Exception e)
        {
            session.removeAttribute("candidateIdentifier");
            homeCandidate(session,response);
        }
        if (session.getAttribute("candidateIdentifier")==null)
        {
            return new ModelAndView("redirect:/loginCandidate");
        }
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        CandidateIdentifier candidateIdentifierVal;
        candidateIdentifierVal=candidateIdentifierRepository.findById(candidateIdentifier.get(0).getId()).orElse(new CandidateIdentifier());
        candidateIdentifierVal.setSubmit(true);
        candidateIdentifierRepository.save(candidateIdentifierVal);
        return new ModelAndView("redirect:/formCandidate");
    }
    @Autowired
    ManagerOfCandidate managerOfCandidate;
    @Autowired
    Optional<ManagerThesis> managerThesis;
    @Autowired
    private EmailSenderService emailSenderService;
    @RequestMapping("formManagerOfCandidate")
    public ModelAndView formManagerOfCandidate(HttpSession session,HttpServletRequest request,HttpServletResponse response)
    {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        if (session.getAttribute("candidateIdentifier")==null)
        {
            return new ModelAndView("redirect:/loginCandidate");
        }
        List<CandidateIdentifier> candidateIdentifier= (List<CandidateIdentifier>) session.getAttribute("candidateIdentifier");
        managerOfCandidate.setIdCandidate(candidateIdentifier.get(0).getId());
        managerOfCandidate.setIdManager(Long.parseLong(request.getParameter("managerThesis")));
        managerThesis=managerThesisRepository.findById(Long.parseLong(request.getParameter("managerThesis")));
        managerOfCandidateRepository.save(managerOfCandidate);
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setTo(managerThesis.get().getEmail());
        mailMessage.setSubject("Demande d'encadrement");
        mailMessage.setFrom("no-reply@edmi.ucad.sn");
        mailMessage.setText("Bonjour Monsieur "+ managerThesis.get().getName()+" "+ managerThesis.get().getSurname()
                +"\n\n\nVous avez une demande d'encadrement dans la plateforme de l'école doctorale.\n\n\n\n\n\n ce message est automatique merci de ne pas répondre");

        emailSenderService.sendEmail(mailMessage);
        session.setAttribute("Status","Votre Demande sera traité.");
        return new ModelAndView("redirect:/dashboardCandidate");
    }

}
