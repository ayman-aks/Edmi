package com.edmi.project.repository;

import com.edmi.project.myclass.ManagerThesis;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ManagerThesisRepository extends CrudRepository<ManagerThesis,Long> {
    List<ManagerThesis>  findByLaboratory(String laboratory);
}
