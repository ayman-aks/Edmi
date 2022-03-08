package com.edmi.project.controller;

import com.edmi.project.myclass.CandidateIdentifier;
import com.edmi.project.repository.CandidateIdentifierRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class SignUpController
{
    @Autowired
    CandidateIdentifierRepository candidateIdentifierRepository;
    @RequestMapping("signUp")
    public ModelAndView signUp(HttpServletRequest request)
    {
        ModelAndView mv=new ModelAndView("signUp.jsp");
        HttpSession session=request.getSession();
        session.removeAttribute("verifiyEmailCandidate");
        return mv;
    }
    @RequestMapping("signUpForm")
    public ModelAndView signUpForm(CandidateIdentifier candidateIdentifier, HttpServletRequest request)
    {
        ModelAndView mv=new ModelAndView("redirect:/signUp");
        HttpSession session=request.getSession();
        Boolean checkEmail=candidateIdentifierRepository.existsByEmail(candidateIdentifier.getEmail());
        if(checkEmail)
        {

            session.setAttribute("verifiyEmailCandidate","emailError");
        }
        else
        {
            session.setAttribute("verifiyEmailCandidate","emailValid");
            candidateIdentifierRepository.save(candidateIdentifier);
        }
        return mv;
    }
}
