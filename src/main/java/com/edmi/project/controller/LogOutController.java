package com.edmi.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class LogOutController {
    @RequestMapping("logOut")
    public ModelAndView logOut(HttpSession session, HttpServletResponse response)
    {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        session.invalidate();
        return new ModelAndView("redirect:/loginCandidate");
    }
    @RequestMapping("logOutPersonnel")
    public ModelAndView logOutPersonnel(HttpSession session, HttpServletResponse response)
    {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        session.invalidate();
        return new ModelAndView("redirect:/loginPersonnel");
    }
}
