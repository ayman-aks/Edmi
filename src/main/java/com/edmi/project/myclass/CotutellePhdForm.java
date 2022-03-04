package com.edmi.project.myclass;

import javax.persistence.*;
@org.springframework.stereotype.Component
@Entity
@Table(name = "cotutelle_phd_Form")
public class CotutellePhdForm {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;
    @Column(nullable = true)
    private String nameAddressUniversity;
    @Column(nullable = true)
    private String nameSurnameManagerFormation;
    @Column(nullable = true)
    private String nameSurnameManagerThesis;

    public String getNameAddressUniversity() {
        return nameAddressUniversity;
    }

    public void setNameAddressUniversity(String nameAddressUniversity) {
        this.nameAddressUniversity = nameAddressUniversity;
    }

    public String getNameSurnameManagerFormation() {
        return nameSurnameManagerFormation;
    }

    public void setNameSurnameManagerFormation(String nameSurnameManagerFormation) {
        this.nameSurnameManagerFormation = nameSurnameManagerFormation;
    }

    public String getNameSurnameManagerThesis() {
        return nameSurnameManagerThesis;
    }

    public void setNameSurnameManagerThesis(String nameSurnameManagerThesis) {
        this.nameSurnameManagerThesis = nameSurnameManagerThesis;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}