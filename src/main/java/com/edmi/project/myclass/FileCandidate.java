package com.edmi.project.myclass;

import org.springframework.stereotype.Component;

import javax.persistence.*;
@Component
@Entity
@Table(name = "file_candidate")
public class FileCandidate {
    @Id
    @Column(name = "id", nullable = false)
    private Long id;
    @Column(nullable = false)
    private String cv;
    @Column(nullable = false)
    private String project;
    @Column
    private String agreement;
    @Column
    private String scholarship;

    public String getCv() {
        return cv;
    }

    public void setCv(String cv) {
        this.cv = cv;
    }

    public String getProject() {
        return project;
    }

    public void setProject(String project) {
        this.project = project;
    }

    public String getAgreement() {
        return agreement;
    }

    public void setAgreement(String agreement) {
        this.agreement = agreement;
    }

    public String getScholarship() {
        return scholarship;
    }

    public void setScholarship(String scholarship) {
        this.scholarship = scholarship;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}