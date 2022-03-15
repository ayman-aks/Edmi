package com.edmi.project.repository;

import com.edmi.project.myclass.ManagerOfCandidate;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ManagerOfCandidateRepository extends CrudRepository<ManagerOfCandidate,Long> {
    Boolean existsByIdCandidate(Long idCandidate);
}
