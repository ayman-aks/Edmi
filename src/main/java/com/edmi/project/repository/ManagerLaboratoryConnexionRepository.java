package com.edmi.project.repository;

import com.edmi.project.myclass.ManagerLaboratory;
import com.edmi.project.myclass.ManagerThesis;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ManagerLaboratoryConnexionRepository extends CrudRepository<ManagerLaboratory,Long>
{
    @Query("from ManagerLaboratory where email=?1 AND password=?2")
    List<ManagerLaboratory> checkConnexion(String email, String password);
}
