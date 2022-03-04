package com.edmi.project.repository;

import com.edmi.project.myclass.CandidateIdentifier;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface CandidateConnexionRepository extends CrudRepository<CandidateIdentifier, Long>
{
    @Query("from CandidateIdentifier where email=?1 AND password=?2")
    List<CandidateIdentifier> checkConnexion(String email, String password);
}
