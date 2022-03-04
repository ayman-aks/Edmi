package com.edmi.project.repository;

import com.edmi.project.myclass.CandidateIdentifier;
import org.springframework.data.repository.CrudRepository;

public interface CandidateIdentifierRepository extends CrudRepository<CandidateIdentifier,Long>
{
    Boolean existsByEmail(String email);
}
