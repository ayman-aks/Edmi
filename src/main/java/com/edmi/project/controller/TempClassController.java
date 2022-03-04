package com.edmi.project.controller;

import com.edmi.project.myclass.CandidateIdentifierForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class TempClassController {
    @Autowired
    CandidateIdentifierForm candidateIdentifierForm;
    @RequestMapping("formCandidate")
    public ModelAndView formCandidate(HttpSession session)
    {
        ModelAndView mv=new ModelAndView("formCandidate.jsp");
        return mv;
    }
}
