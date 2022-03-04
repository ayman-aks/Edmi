package com.edmi.project.myclass;

import org.springframework.stereotype.Component;

@Component
public class CandidateConnexion {
    private String email;
    private String password;

    public CandidateConnexion() {
        super();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
