package com.edmi.project.repository;

import com.edmi.project.myclass.HeadInstitution;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface HeadInstitutionConnexionRepository extends CrudRepository<HeadInstitution,Long>
{
    @Query("from HeadInstitution where email=?1 AND password=?2")
    List<HeadInstitution> checkConnexion(String email, String password);
}
