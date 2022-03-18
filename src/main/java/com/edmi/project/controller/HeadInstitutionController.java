package com.edmi.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class HeadInstitutionController {
    @RequestMapping("dashboardHeadInstitution")
    public ModelAndView dashboardHeadInstitution(HttpSession session, HttpServletResponse response)
    {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        if (session.getAttribute("headInstitution")==null){
            return new ModelAndView("redirect:loginPersonnel");
        }
        return new ModelAndView("dashboardHeadInstitution.jsp");
    }
}
