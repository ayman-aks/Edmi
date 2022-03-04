package com.edmi.project.repository;

import com.edmi.project.myclass.ManagerPhd;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ManagerPhdConnexionRepository extends CrudRepository<ManagerPhd,Long>
{
    @Query("from ManagerPhd where email=?1 AND password=?2")
    List<ManagerPhd> checkConnexion(String email, String password);
}
