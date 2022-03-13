package com.edmi.project.myclass;

import javax.persistence.*;
import java.util.Date;
import java.util.UUID;

@Entity
@Table(name = "confirmation_token")
public class ConfirmationToken {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "token_id", nullable = false)
    private Long token_id;
    @Column(name="confirmation_token")
    private String confirmationToken;

    @Temporal(TemporalType.TIMESTAMP)
    private Date createdDate;

    @OneToOne(targetEntity = CandidateIdentifier.class, fetch = FetchType.EAGER)
    @JoinColumn(nullable = false, name = "candidate_id")
    private CandidateIdentifier candidateIdentifier;

    public ConfirmationToken(CandidateIdentifier candidateIdentifier) {
        this.candidateIdentifier = candidateIdentifier;
        createdDate = new Date();
        confirmationToken = UUID.randomUUID().toString();
    }

    public ConfirmationToken() {
    }

    public Long getToken_id() {
        return token_id;
    }

    public void setToken_id(Long token_id) {
        this.token_id = token_id;
    }

    public String getConfirmationToken() {
        return confirmationToken;
    }

    public void setConfirmationToken(String confirmationToken) {
        this.confirmationToken = confirmationToken;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public CandidateIdentifier getCandidateIdentifier() {
        return candidateIdentifier;
    }

    public void setCandidateIdentifier(CandidateIdentifier candidateIdentifier) {
        this.candidateIdentifier = candidateIdentifier;
    }
}