package com.edmi.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeManagerThesis {
    @RequestMapping("homeManagerThesis")
    public ModelAndView homeManagerThesis()
    {
        return new ModelAndView("loginCandidate.jsp");
    }
    /*@RequestMapping("acceptCandidacy")
    public ModelAndView accep*/
}
