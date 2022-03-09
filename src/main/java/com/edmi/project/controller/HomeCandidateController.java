package com.edmi.project.controller;

import com.edmi.project.myclass.*;
import com.edmi.project.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
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
    public ModelAndView homeCandidate(HttpSession session)
    {
        ModelAndView mv=new ModelAndView();
        List<CandidateIdentifier> candidateIdentifier= (List<CandidateIdentifier>) session.getAttribute("candidateIdentifier");
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
    @RequestMapping("dashboardCandidate")
    public ModelAndView dashboard(HttpSession session)
    {
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
    PhdSoughtFormRepository phdSoughtFormRepository;
    @Autowired
    EvolutionCandidacyRepository evolutionCandidacyRepository;
    @Autowired
    EvolutionCandidacy evolutionCandidacy;
    @Autowired
    List<CandidateIdentifier> candidateIdentifier;
    @Autowired
    CotutellePhdForm cotutellePhdForm;
    @Autowired
    PhdSoughtForm phdSoughtForm;
    @RequestMapping("homeCandidateForm")
    public ModelAndView homeCandidateForm(HttpServletRequest request,HttpSession session) throws IOException
    {
        if (session.getAttribute("candidateIdentifier")==null)
        {
            return new ModelAndView("loginCandidate.jsp");
        }
        candidateIdentifier= (List<CandidateIdentifier>) session.getAttribute("candidateIdentifier");
        CandidateIdentifier candidateIdentifierFirstElement=candidateIdentifier.get(0);
        candidateIdentifierForm.setId(candidateIdentifierFirstElement.getId());
        candidateIdentifierForm.setHomeAddress(request.getParameter("homeAddress").toString());
        candidateIdentifierForm.setNameWife(request.getParameter("nameWife").toString());
        candidateIdentifierForm.setName(candidateIdentifierFirstElement.getName());
        candidateIdentifierForm.setSurname(candidateIdentifierFirstElement.getSurname());
        candidateIdentifierForm.setEmail(candidateIdentifierFirstElement.getName());
        candidateIdentifierForm.setPhoneNumber(request.getParameter("phoneNumber").toString());

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
        phdSoughtForm.setPhdSchool(request.getParameter("phdSchool"));
        phdSoughtForm.setTopicPhd(request.getParameter("topicPhd"));
        phdSoughtForm.setNameAddressLaboratory(request.getParameter("nameAddressLaboratory"));

        cotutellePhdForm.setId(candidateIdentifierFirstElement.getId());
        cotutellePhdForm.setNameAddressUniversity(request.getParameter("nameAddressUniversity"));
        cotutellePhdForm.setNameSurnameManagerFormation(request.getParameter("nameSurnameManagerFormation"));
        cotutellePhdForm.setNameSurnameManagerThesis(request.getParameter("nameSurnameManagerThesis"));

        evolutionCandidacy.setId(candidateIdentifierFirstElement.getId());
        evolutionCandidacy.setEvolution(1);

        try{
        candidateIdentifierFormRepository.save(candidateIdentifierForm);
        candidateUniversityCurriculumFormRepository.save(candidateUniversityCurriculumForm);
        cotutellePhdFormRepository.save(cotutellePhdForm);
        phdSoughtFormRepository.save(phdSoughtForm);
        evolutionCandidacyRepository.save(evolutionCandidacy);}
        catch (Exception e) {
            System.out.println(e);
    }
        return new ModelAndView("redirect:/dashboardCandidate");
    }
    @RequestMapping("uploadFile")
    public ModelAndView uploadFile(HttpSession session)
    {
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
    }
    @RequestMapping("formCandidate")
    public ModelAndView formCandidate(HttpSession session)
    {
        ModelAndView mv=new ModelAndView("formCandidate.jsp");
        Optional<CandidateIdentifierForm> candidateIdentifierForm;
        Optional<CandidateUniversityCurriculumForm> candidateUniversityCurriculumForm;
        Optional<CotutellePhdForm> cotutellePhdForm;
        Optional<PhdSoughtForm> phdSoughtForm;
        List<CandidateIdentifier> candidateIdentifier= (List<CandidateIdentifier>) session.getAttribute("candidateIdentifier");
        if (session.getAttribute("candidateIdentifier")==null)
        {
            return new ModelAndView("loginCandidate.jsp");
        }
        Long checkIdForPage=candidateIdentifier.get(0).getId();
        candidateIdentifierForm=candidateIdentifierFormRepository.findById(checkIdForPage);
        candidateUniversityCurriculumForm=candidateUniversityCurriculumFormRepository.findById(checkIdForPage);
        cotutellePhdForm=cotutellePhdFormRepository.findById(checkIdForPage);
        phdSoughtForm=phdSoughtFormRepository.findById(checkIdForPage);
        mv.addObject("candidateIdentifierForm",candidateIdentifierForm);
        mv.addObject("candidateUniversityCurriculumForm",candidateUniversityCurriculumForm);
        mv.addObject("phdSoughtForm",phdSoughtForm);
        mv.addObject("cotutellePhdForm",cotutellePhdForm);
        System.out.println(candidateIdentifierForm.get().getNameWife());
        return mv;
    }

}
