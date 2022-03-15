package com.edmi.project.controller;

import com.edmi.project.myclass.CandidateIdentifier;
import com.edmi.project.myclass.ConfirmationToken;
import com.edmi.project.repository.CandidateIdentifierRepository;
import com.edmi.project.repository.ConfirmationTokenRepository;
import com.edmi.project.service.EmailSenderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;

@Controller
public class SignUpController
{
    @Autowired
    CandidateIdentifierRepository candidateIdentifierRepository;
    @Autowired
    private ConfirmationTokenRepository confirmationTokenRepository;

    @Autowired
    private EmailSenderService emailSenderService;
    @RequestMapping("signUp")
    public ModelAndView signUp(HttpServletResponse response,HttpSession session)
    {
        if (session.getAttribute("candidateIdentifier")!=null)
        {
            return new ModelAndView("redirect:homeCandidate");
        }
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        ModelAndView mv=new ModelAndView("signUp.jsp");
        return mv;
    }
    @RequestMapping("signUpForm")
    public ModelAndView signUpForm(CandidateIdentifier candidateIdentifier, HttpSession session,HttpServletRequest request,HttpServletResponse response)
    {
        if (session.getAttribute("candidateIdentifier")!=null)
        {
            return new ModelAndView("redirect:homeCandidate");
        }
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        ModelAndView mv=new ModelAndView("redirect:/signUp");
        if (request.getParameter("name")==null)
        {
            return mv;
        }
        Boolean checkEmail=candidateIdentifierRepository.existsByEmail(candidateIdentifier.getEmail());
        if(checkEmail)
        {

            session.setAttribute("verifiyEmailCandidate","Exist Email");
        }
        else
        {
            candidateIdentifierRepository.save(candidateIdentifier);
            ConfirmationToken confirmationToken = new ConfirmationToken(candidateIdentifier);

            confirmationTokenRepository.save(confirmationToken);

            SimpleMailMessage mailMessage = new SimpleMailMessage();
            mailMessage.setTo(candidateIdentifier.getEmail());
            mailMessage.setSubject("Valider Votre Inscription dans le site de l'école doctorale");
            mailMessage.setFrom("no-reply@edmi.ucad.sn");
            mailMessage.setText("To confirm your account, please click here : "
                    +"http://localhost:8080/confirm-account?token="+confirmationToken.getConfirmationToken()+" \n\n\n\n\n ce message est automatique merci de ne pas répondre");

            emailSenderService.sendEmail(mailMessage);
            session.setAttribute("verifiyEmailCandidate","True");

        }
        return mv;
    }
    @RequestMapping(value="/confirm-account", method= {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView confirmUserAccount(ModelAndView modelAndView, HttpServletResponse response, @RequestParam("token")String confirmationToken, HttpSession session)
    {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        ConfirmationToken token = confirmationTokenRepository.findByConfirmationToken(confirmationToken);

        if(token != null)
        {
            CandidateIdentifier candidateIdentifier = candidateIdentifierRepository.findById(token.getCandidateIdentifier().getId()).orElse(new CandidateIdentifier());
            candidateIdentifier.setEnabled(true);
            candidateIdentifierRepository.save(candidateIdentifier);
            session.removeAttribute("candidateIdentifier");
            confirmationTokenRepository.delete(token);
            File file=new File("fileCandidate/"+candidateIdentifier.getId());
            file.mkdir();
            session.setAttribute("Status","Votre compte est activé");
            modelAndView.setViewName("loginCandidate");
        }
        else
        {
            session.setAttribute("Status","The link is invalid or broken!");
            modelAndView.setViewName("redirect:/loginCandidate");
        }

        return modelAndView;
    }
}
