package com.edmi.project.repository;

import com.edmi.project.myclass.CandidateIdentifier;
import com.edmi.project.myclass.ManagerThesis;
import com.edmi.project.myclass.ManagerThesisConnexion;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ManagerThesisConnexionRepository extends CrudRepository<ManagerThesis,Long>
{
    @Query("from ManagerThesis where email=?1 AND password=?2")
    List<ManagerThesis> checkConnexion(String email, String password);

}
