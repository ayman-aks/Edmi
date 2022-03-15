package com.edmi.project.controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyErrorController implements ErrorController {
    @RequestMapping("/error")
    public ModelAndView error()
    {
        return new ModelAndView("error.jsp");
    }
}
