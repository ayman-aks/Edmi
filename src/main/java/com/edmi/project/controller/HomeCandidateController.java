package com.edmi.project.controller;

import com.edmi.project.myclass.*;
import com.edmi.project.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class HomeCandidateController
{
    @Autowired
    CandidateIdentifierFormRepository candidateIdentifierFormRepository;//We will use it to verify if candidate is in Database to mask the form in view
    @RequestMapping("homeCandidate")
    public ModelAndView homeCandidate()
    {
        ModelAndView mv=new ModelAndView("homeCandidate.jsp");
        return mv;
    }
    @Autowired
    CandidateUniversityCurriculumFormRepository candidateUniversityCurriculumFormRepository;
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
    CandidateIdentifierForm candidateIdentifierForm;
    @Autowired
    CandidateUniversityCurriculumForm candidateUniversityCurriculumForm ;
    @Autowired
    CotutellePhdForm cotutellePhdForm;
    @Autowired
    PhdSoughtForm phdSoughtForm;
    @RequestMapping("homeCandidateForm")
    public ModelAndView homeCandidateForm(HttpServletRequest request,HttpSession session)
    {
        candidateIdentifier= (List<CandidateIdentifier>) session.getAttribute("candidateIdentifier");
        CandidateIdentifier candidateIdentifierFirstElement=candidateIdentifier.get(0);
        candidateIdentifierForm.setId(candidateIdentifierFirstElement.getId());
        candidateIdentifierForm.setHomeAdress(request.getParameter("homeAdress").toString());
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

        session.setAttribute("candidateIdentifierForm",candidateIdentifierForm);
        session.setAttribute("candidateUniversityCurriculumForm",candidateUniversityCurriculumForm);
        session.setAttribute("phdSoughtForm",phdSoughtForm);
        session.setAttribute("cotutellePhdForm",cotutellePhdForm);

        candidateIdentifierFormRepository.save(candidateIdentifierForm);
        candidateUniversityCurriculumFormRepository.save(candidateUniversityCurriculumForm);
        cotutellePhdFormRepository.save(cotutellePhdForm);
        phdSoughtFormRepository.save(phdSoughtForm);
        evolutionCandidacyRepository.save(evolutionCandidacy);
        return new ModelAndView("redirect:/formCandidate.jsp");
    }

}
