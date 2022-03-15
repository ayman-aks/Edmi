package com.edmi.project.repository;

import com.edmi.project.myclass.ManagerThesis;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface ManagerThesisConnexionRepository extends CrudRepository<ManagerThesis,Long>
{
    @Query("from ManagerThesis where email=?1 AND password=?2")
    List<ManagerThesis> checkConnexion(String email, String password);
}
