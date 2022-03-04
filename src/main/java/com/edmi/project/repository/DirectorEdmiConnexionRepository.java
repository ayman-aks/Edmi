package com.edmi.project.repository;

import com.edmi.project.myclass.DirectorEdmi;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface DirectorEdmiConnexionRepository extends CrudRepository<DirectorEdmi,Long>
{
    @Query("from ManagerThesis where email=?1 AND password=?2")
    List<DirectorEdmi> checkConnexion(String email, String password);
}
