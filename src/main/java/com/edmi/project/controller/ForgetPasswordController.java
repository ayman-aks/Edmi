package com.edmi.project.controller;

import com.edmi.project.myclass.CandidateConnexion;
import com.edmi.project.myclass.CandidateIdentifier;
import com.edmi.project.myclass.PasswordToken;
import com.edmi.project.repository.CandidateConnexionRepository;
import com.edmi.project.repository.CandidateIdentifierRepository;
import com.edmi.project.repository.PasswordTokenRepository;
import com.edmi.project.service.EmailSenderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class ForgetPasswordController {
    @Autowired
    CandidateConnexionRepository candidateConnexionRepository;
    @Autowired
    PasswordTokenRepository passwordTokenRepository;
    @Autowired
    CandidateIdentifierRepository candidateIdentifierRepository;
    @Autowired
    CandidateIdentifier candidateIdentifier;
    @Autowired
    private EmailSenderService emailSenderService;
    @RequestMapping("forgetPasswordCandidate")
    public ModelAndView test(HttpSession session,HttpServletResponse response)
    {
        if (session.getAttribute("candidateIdentifier")!=null)
        {
            return new ModelAndView("redirect:/homeCandidate");
        }
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        return new ModelAndView("forgetPasswordCandidate.jsp");
    }
    @RequestMapping("forgetPasswordForm")
    public ModelAndView forgetPassword(CandidateConnexion candidateConnexion, HttpSession session, HttpServletResponse response)
    {
        if (session.getAttribute("candidateIdentifier")!=null)
        {
            return new ModelAndView("redirect:/homeCandidate");
        }
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        if (candidateConnexion.getEmail()==null)
        {
            return new ModelAndView("redirect:/forgetPasswordCandidate");
        }
        ModelAndView mv=new ModelAndView();
        Boolean check=candidateIdentifierRepository.existsByEmail(candidateConnexion.getEmail());
        if (check)
        {
            candidateIdentifier=candidateIdentifierRepository.findByEmail(candidateConnexion.getEmail());
            PasswordToken passwordToken = new PasswordToken(candidateIdentifier);
            passwordTokenRepository.save(passwordToken);
            SimpleMailMessage mailMessage = new SimpleMailMessage();
            mailMessage.setTo(candidateIdentifier.getEmail());
            mailMessage.setSubject("Modifier Votre Mot de passe de votre compte de l'école doctorale");
            mailMessage.setFrom("no-reply@edmi.ucad.sn");
            mailMessage.setText("To confirm your account, please click here : "
                    +"http://edmi.ddns.net:8080/forget-password?token-password="+passwordToken.getConfirmationToken()+" \n\n\n\n\n ce message est automatique merci de ne pas répondre");

            emailSenderService.sendEmail(mailMessage);
            session.setAttribute("Status","Password Sent");
            mv.setViewName("redirect:/loginCandidate");
        }
        else {
            session.setAttribute("Status","Compte non retrouvé");
            mv.setViewName("redirect:/forgetPasswordCandidate");
        }
        return mv;
    }
    @RequestMapping(value="/forget-password", method= {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView confirmUserAccount(ModelAndView modelAndView,@RequestParam("token-password")String confirmationToken, HttpSession session, HttpServletResponse response)
    {
        if (session.getAttribute("candidateIdentifier")!=null)
        {
            return new ModelAndView("redirect:/homeCandidate");
        }
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        PasswordToken token = passwordTokenRepository.findByConfirmationToken(confirmationToken);

        if(token != null)
        {
            CandidateIdentifier candidateIdentifier = candidateIdentifierRepository.findById(token.getCandidateIdentifier().getId()).orElse(new CandidateIdentifier());
            session.setAttribute("confirmationToken",confirmationToken);
            session.setAttribute("candidateIdentifier",candidateIdentifier);
            modelAndView.setViewName("forgetPassword.jsp");
        }
        else
        {
            session.removeAttribute("confirmationToken");
            session.removeAttribute("candidateIdentifier");
            session.setAttribute("Status","The link is invalid or broken!");
            modelAndView.setViewName("redirect:/loginCandidate");
        }

        return modelAndView;
    }
    @RequestMapping("forgetPasswordConfirm")
    public ModelAndView forgetPasswordForm(ModelAndView modelAndView,HttpSession session,String password,HttpServletResponse response)
    {
        if (session.getAttribute("confirmationToken")==null)
        {
            return new ModelAndView("redirect:/homeCandidate");
        }
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        String confirmationToken=null;
        if (session.getAttribute("confirmationToken")!=null)
        {
            confirmationToken=session.getAttribute("confirmationToken").toString();
        }
        PasswordToken token = passwordTokenRepository.findByConfirmationToken(confirmationToken);
        if(token != null)
        {
            CandidateIdentifier candidateIdentifier = candidateIdentifierRepository.findById(token.getCandidateIdentifier().getId()).orElse(new CandidateIdentifier());
            candidateIdentifier.setPassword(password);
            candidateIdentifierRepository.save(candidateIdentifier);
            passwordTokenRepository.deleteById(token.getToken_id());
            session.removeAttribute("confirmationToken");
            session.removeAttribute("candidateIdentifier");
            session.setAttribute("Status","Valid Password");
            modelAndView.setViewName("redirect:/loginCandidate");
        }
        else
        {
            session.setAttribute("Status","Opération Impossible");
            modelAndView.setViewName("redirect:/loginCandidate");
        }
        return modelAndView;
    }

}
