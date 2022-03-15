package com.edmi.project.controller;

import com.edmi.project.myclass.CandidateIdentifier;
import com.edmi.project.myclass.FileCandidate;
import com.edmi.project.myclass.FileUploadUtil;
import com.edmi.project.repository.FileCandidateRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
public class UploadFileController {
    @Autowired
    FileCandidateRepository fileCandidateRepository;
    @Autowired
    FileCandidate fileCandidate;
    @RequestMapping("uploadFileForm")
    public ModelAndView uploadFileForm(HttpSession session, @RequestParam("cv") MultipartFile multipartFile1, @RequestParam("project") MultipartFile multipartFile2, @RequestParam("agreement") MultipartFile multipartFile3, @RequestParam("scholarship") MultipartFile multipartFile4) throws IOException {
        if (multipartFile1.isEmpty()){
            return new ModelAndView("redirect:homeCandidate");
        }
        List<CandidateIdentifier> candidateIdentifier= (List<CandidateIdentifier>) session.getAttribute("candidateIdentifier");
        fileCandidate.setId(candidateIdentifier.get(0).getId());
        fileCandidate.setCv("cv.pdf");
        fileCandidate.setProject("Project.pdf");
        fileCandidate.setAgreement("Agreement.pdf");
        if (multipartFile3==null)
        {
            fileCandidate.setAgreement("null");
        }
        else{
            fileCandidate.setAgreement("Agreement.pdf");
        }
        if (multipartFile4==null)
        {
            fileCandidate.setScholarship("null");
        }
        else{
            fileCandidate.setScholarship("Scholarship.pdf");
        }
        fileCandidateRepository.save(fileCandidate);
        String uploadDir = "fileCandidate/" + candidateIdentifier.get(0).getId();

        FileUploadUtil.saveFile(uploadDir, fileCandidate.getCv(), multipartFile1);
        FileUploadUtil.saveFile(uploadDir, fileCandidate.getProject(), multipartFile2);
        FileUploadUtil.saveFile(uploadDir, fileCandidate.getAgreement(), multipartFile3);
        FileUploadUtil.saveFile(uploadDir, fileCandidate.getScholarship(), multipartFile4);
        return new ModelAndView("redirect:homeCandidate");
    }
}
