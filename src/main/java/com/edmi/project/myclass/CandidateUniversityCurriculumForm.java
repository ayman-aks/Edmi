package com.edmi.project.myclass;

import javax.persistence.*;
@org.springframework.stereotype.Component
@Entity
@Table(name = "candidate_university_curriculum_Form")
public class CandidateUniversityCurriculumForm {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;
    @Column(nullable = false)
    private String accessDiploma;
    @Column(nullable = false)
    private String speciality;
    @Column(nullable = false)
    private String university;
    @Column(nullable = false)
    private String country;
    @Column(nullable = false)
    private String dateDiploma;
    @Column(nullable = false)
    private String placeDiploma;
    @Column(nullable = false)
    private String mention;

    public String getAccessDiploma() {
        return accessDiploma;
    }

    public void setAccessDiploma(String accessDiploma) {
        this.accessDiploma = accessDiploma;
    }

    public String getSpeciality() {
        return speciality;
    }

    public void setSpeciality(String speciality) {
        this.speciality = speciality;
    }

    public String getUniversity() {
        return university;
    }

    public void setUniversity(String university) {
        this.university = university;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getDateDiploma() {
        return dateDiploma;
    }

    public void setDateDiploma(String dateDiploma) {
        this.dateDiploma = dateDiploma;
    }

    public String getPlaceDiploma() {
        return placeDiploma;
    }

    public void setPlaceDiploma(String placeDiploma) {
        this.placeDiploma = placeDiploma;
    }

    public String getMention() {
        return mention;
    }

    public void setMention(String mention) {
        this.mention = mention;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}