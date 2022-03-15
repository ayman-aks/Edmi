package com.edmi.project.myclass;

import org.springframework.stereotype.Component;

import javax.persistence.*;

@Component
@Entity
@Table(name = "phd_sought_Form")
public class PhdSoughtForm {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;
    @Column(nullable = false,columnDefinition = "TEXT")
    private String entitled;
    @Column(nullable = false)
    private String institute;
    @Column(nullable = false)
    private String phdSchool="EDMI";
    @Column(nullable = false,columnDefinition = "TEXT")
    private String nameAddressLaboratory;
    @Column(nullable = false,columnDefinition = "TEXT")
    private String topicPhd;

    public String getEntitled() {
        return entitled;
    }

    public void setEntitled(String entitled) {
        this.entitled = entitled;
    }

    public String getInstitute() {
        return institute;
    }

    public void setInstitute(String institute) {
        this.institute = institute;
    }

    public String getPhdSchool() {
        return phdSchool;
    }

    public void setPhdSchool(String phdSchool) {
        this.phdSchool = phdSchool;
    }

    public String getNameAddressLaboratory() {
        return nameAddressLaboratory;
    }

    public void setNameAddressLaboratory(String nameAddressLaboratory) {
        this.nameAddressLaboratory = nameAddressLaboratory;
    }

    public String getTopicPhd() {
        return topicPhd;
    }

    public void setTopicPhd(String topicPhd) {
        this.topicPhd = topicPhd;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

}