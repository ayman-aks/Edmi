package com.edmi.project.controller;

import com.edmi.project.myclass.*;
import com.edmi.project.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class LoginController {
    @Autowired
    CandidateConnexionRepository candidateConnexionRepository;
    @RequestMapping("loginCandidate")
    public ModelAndView loginCandidate(HttpSession session, HttpServletResponse response)
    {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        if (session.getAttribute("candidateIdentifier")!=null){
            return new ModelAndView("redirect:/homeCandidate");
        }
        else {
            return new ModelAndView("loginCandidate.jsp");
        }
    }
    @Autowired
    CandidateIdentifierFormRepository candidateIdentifierFormRepository;//we'll use this to redirect the client into the right page
    @RequestMapping("loginCandidateForm")
    public ModelAndView formLoginCandidate(CandidateConnexion candidateConnexion,HttpSession session, HttpServletResponse response)
    {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        ModelAndView mv=new ModelAndView();
        List<CandidateIdentifier> candidateIdentifier =candidateConnexionRepository.checkConnexion(candidateConnexion.getEmail(),candidateConnexion.getPassword());
        if(candidateIdentifier.size()==0)
        {
            session.setAttribute("errorStatus","Compte non retrouvé");
            mv.setViewName("redirect:/loginCandidate");
        }
        else
        {
            Long checkIdForPage=candidateIdentifier.get(0).getId();
            if(candidateIdentifierFormRepository.existsById(checkIdForPage)) {
                mv.addObject("Status", "dashboard");
                mv.setViewName("redirect:/dashboardCandidate");
                session.setAttribute("candidateIdentifier", candidateIdentifier);
            }
            else {
                    if (candidateIdentifier.get(0).getEnabled()==false)
                    {
                        session.setAttribute("errorStatus", "Compte non autorisé");
                        mv.setViewName("redirect:/loginCandidate");
                    }
                    else
                    {
                        mv.addObject("Status", "connexion");
                        mv.setViewName("redirect:/homeCandidate");
                        session.setAttribute("candidateIdentifier", candidateIdentifier);
                    }
            }
        }
        return mv;
    }
    @Autowired
    ManagerThesisConnexionRepository managerThesisConnexionRepository;
    @RequestMapping("loginPersonnel")
    public ModelAndView loginPersonnel(HttpServletResponse response,HttpSession session)
    {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        if (session.getAttribute("managerThesis")!=null){
            return new ModelAndView("redirect:dashboardManagerThesis");
        }
        if (session.getAttribute("managerLaboratory")!=null){
            return new ModelAndView("redirect:dashboardManagerLaboratory");
        }
        if (session.getAttribute("managerPhd")!=null){
            return new ModelAndView("redirect:dashboardManagerPhd");
        }
        if (session.getAttribute("managerPhd")!=null){
            return new ModelAndView("redirect:dashboardManagerPhd");
        }
        if (session.getAttribute("directorEdmi")!=null){
            return new ModelAndView("redirect:dashboardDirectorEdmi");
        }
        if (session.getAttribute("headInstitution")!=null){
            return new ModelAndView("redirect:dashboardHeadInstitution");
        }
        ModelAndView mv=new ModelAndView("loginPersonnel.jsp");
        return mv;
    }
    @RequestMapping("loginManagerThesisForm")
    public ModelAndView formLoginManagerThesis(ManagerThesisConnexion managerThesisConnexion,HttpSession session,HttpServletResponse response)
    {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        if (session.getAttribute("managerThesis")!=null){
            return new ModelAndView("redirect:dashboardManagerThesis");
        }
        if (session.getAttribute("managerLaboratory")!=null){
            return new ModelAndView("redirect:dashboardManagerLaboratory");
        }
        if (session.getAttribute("managerPhd")!=null){
            return new ModelAndView("redirect:dashboardManagerPhd");
        }
        if (session.getAttribute("managerPhd")!=null){
            return new ModelAndView("redirect:dashboardManagerPhd");
        }
        if (session.getAttribute("directorEdmi")!=null){
            return new ModelAndView("redirect:dashboardDirectorEdmi");
        }
        if (session.getAttribute("headInstitution")!=null){
            return new ModelAndView("redirect:dashboardHeadInstitution");
        }
        ModelAndView mv=new ModelAndView();
        List<ManagerThesis> managerThesis = managerThesisConnexionRepository.checkConnexion(managerThesisConnexion.getEmail(),managerThesisConnexion.getPassword());
        if(managerThesis.size()==0)
        {
            session.setAttribute("errorStatus","Error");
            mv.setViewName("redirect:loginPersonnel");
        }
        else
        {
            mv.addObject("errorStatus","emailValid");
            session.setAttribute("managerThesis",managerThesis.get(0));
            mv.setViewName("redirect:dashboardManagerThesis");
        }
        return mv;
    }

    @Autowired
    ManagerLaboratoryConnexionRepository managerLaboratoryConnexionRepository;
    @RequestMapping("loginManagerLaboratoryForm")
    public ModelAndView formLoginManagerLaboratory(ManagerLaboratoryConnexion managerLaboratoryConnexion,HttpSession session,HttpServletResponse response)
    {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        if (session.getAttribute("managerThesis")!=null){
            return new ModelAndView("redirect:dashboardManagerThesis");
        }
        if (session.getAttribute("managerLaboratory")!=null){
            return new ModelAndView("redirect:dashboardManagerLaboratory");
        }
        if (session.getAttribute("managerPhd")!=null){
            return new ModelAndView("redirect:dashboardManagerPhd");
        }
        if (session.getAttribute("managerPhd")!=null){
            return new ModelAndView("redirect:dashboardManagerPhd");
        }
        if (session.getAttribute("directorEdmi")!=null){
            return new ModelAndView("redirect:dashboardDirectorEdmi");
        }
        if (session.getAttribute("headInstitution")!=null){
            return new ModelAndView("redirect:dashboardHeadInstitution");
        }
        ModelAndView mv=new ModelAndView();
        List<ManagerLaboratory> managerLaboratory = managerLaboratoryConnexionRepository.checkConnexion(managerLaboratoryConnexion.getEmail(),managerLaboratoryConnexion.getPassword());
        if(managerLaboratory.size()==0)
        {
            mv.addObject("errorStatus","Error");
            mv.setViewName("redirect:loginPersonnel");
        }
        else
        {
            mv.addObject("errorStatus","emailValid");
            session.setAttribute("managerLaboratory",managerLaboratory.get(0));
            mv.setViewName("redirect:dashboardManagerLaboratory");
        }
        return mv;
    }
    @Autowired
    ManagerPhdConnexionRepository managerPhdConnexionRepository;
    @RequestMapping("loginManagerPhdForm")
    public ModelAndView formLoginManagerPhd(ManagerPhdConnexion managerPhdConnexion,HttpSession session,HttpServletResponse response)
    {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        if (session.getAttribute("managerThesis")!=null){
            return new ModelAndView("redirect:dashboardManagerThesis");
        }
        if (session.getAttribute("managerLaboratory")!=null){
            return new ModelAndView("redirect:dashboardManagerLaboratory");
        }
        if (session.getAttribute("managerPhd")!=null){
            return new ModelAndView("redirect:dashboardManagerPhd");
        }
        if (session.getAttribute("managerPhd")!=null){
            return new ModelAndView("redirect:dashboardManagerPhd");
        }
        if (session.getAttribute("directorEdmi")!=null){
            return new ModelAndView("redirect:dashboardDirectorEdmi");
        }
        if (session.getAttribute("headInstitution")!=null){
            return new ModelAndView("redirect:dashboardHeadInstitution");
        }
        ModelAndView mv=new ModelAndView();
        List<ManagerPhd> managerPhd = managerPhdConnexionRepository.checkConnexion(managerPhdConnexion.getEmail(),managerPhdConnexion.getPassword());
        if(managerPhd.size()==0)
        {
            mv.addObject("errorStatus","Error");
            mv.setViewName("redirect:loginPersonnel");
        }
        else
        {
            mv.addObject("errorStatus","emailValid");
            session.setAttribute("managerPhd",managerPhd.get(0));
            mv.setViewName("redirect:dashboardManagerPhd");
        }
        return mv;
    }
    @Autowired
    DirectorEdmiConnexionRepository directorEdmiConnexionRepository;
    @RequestMapping("loginDirectorEdmiForm")
    public ModelAndView formLoginDirectorEdmi(DirectorEdmiConnexion directorEdmiConnexion,HttpSession session,HttpServletResponse response)
    {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        if (session.getAttribute("managerThesis")!=null){
            return new ModelAndView("redirect:dashboardManagerThesis");
        }
        if (session.getAttribute("managerLaboratory")!=null){
            return new ModelAndView("redirect:dashboardManagerLaboratory");
        }
        if (session.getAttribute("managerPhd")!=null){
            return new ModelAndView("redirect:dashboardManagerPhd");
        }
        if (session.getAttribute("managerPhd")!=null){
            return new ModelAndView("redirect:dashboardManagerPhd");
        }
        if (session.getAttribute("directorEdmi")!=null){
            return new ModelAndView("redirect:dashboardDirectorEdmi");
        }
        if (session.getAttribute("headInstitution")!=null){
            return new ModelAndView("redirect:dashboardHeadInstitution");
        }
        ModelAndView mv=new ModelAndView();
        List<DirectorEdmi> directorEdmi = directorEdmiConnexionRepository.checkConnexion(directorEdmiConnexion.getEmail(),directorEdmiConnexion.getPassword());
        if(directorEdmi.size()==0)
        {
            mv.addObject("errorStatus","Error");
            mv.setViewName("redirect:loginPersonnel");
        }
        else
        {
            mv.addObject("errorStatus","emailValid");
            session.setAttribute("directorEdmi",directorEdmi.get(0));
            mv.setViewName("redirect:dashboardDirectorEdmi");
        }
        return mv;
    }
    @Autowired
    HeadInstitutionConnexionRepository headInstitutionConnexionRepository;
    @RequestMapping("loginHeadInstitutionForm")
    public ModelAndView formLoginHeadInstitution(HeadInstitutionConnexion headInstitutionConnexion,HttpSession session,HttpServletResponse response)
    {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        if (session.getAttribute("managerThesis")!=null){
            return new ModelAndView("redirect:dashboardManagerThesis");
        }
        if (session.getAttribute("managerLaboratory")!=null){
            return new ModelAndView("redirect:dashboardManagerLaboratory");
        }
        if (session.getAttribute("managerPhd")!=null){
            return new ModelAndView("redirect:dashboardManagerPhd");
        }
        if (session.getAttribute("managerPhd")!=null){
            return new ModelAndView("redirect:dashboardManagerPhd");
        }
        if (session.getAttribute("directorEdmi")!=null){
            return new ModelAndView("redirect:dashboardDirectorEdmi");
        }
        if (session.getAttribute("headInstitution")!=null){
            return new ModelAndView("redirect:dashboardHeadInstitution");
        }
        ModelAndView mv=new ModelAndView();
        List<HeadInstitution> headInstitution = headInstitutionConnexionRepository.checkConnexion(headInstitutionConnexion.getEmail(),headInstitutionConnexion.getPassword());
        if(headInstitution.size()==0)
        {
            mv.addObject("errorStatus","Error");
            mv.setViewName("redirect:loginPersonnel");
        }
        else
        {
            mv.addObject("errorStatus","emailValid");
            session.setAttribute("headInstitution",headInstitution);
            mv.setViewName("redirect:dashboardHeadInstitution");
        }
        return mv;
    }

}
