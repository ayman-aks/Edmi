package com.edmi.project.myclass;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@org.springframework.stereotype.Component
@Entity
@Table(name = "candidate_identifier_form")
public class CandidateIdentifierForm {
    @Id
    @Column(name = "id", nullable = false)
    private Long id;
    @Column(nullable = true)
    private String nameWife;
    @Column(nullable = false)
    private String name;
    @Column(nullable = false)
    private String surname;
    @Column(nullable = false,unique = true)
    private String email;
    @Column(nullable = false, columnDefinition = "TEXT")
    private String homeAdress;
    @Column(nullable = false)
    private String phoneNumber;


    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getHomeAdress() {
        return homeAdress;
    }

    public void setHomeAdress(String homeAdress) {
        this.homeAdress = homeAdress;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public String getNameWife() {
        return nameWife;
    }

    public void setNameWife(String nameWife) {
        this.nameWife = nameWife;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}