package com.edmi.project.repository;

import com.edmi.project.myclass.ManagerOfCandidate;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ManagerOfCandidateRepository extends CrudRepository<ManagerOfCandidate,Long> {
    Boolean existsByIdCandidate(Long idCandidate);
    List<ManagerOfCandidate> findByIdManagerAndDecision(Long idManager, Boolean decision);
    ManagerOfCandidate findByIdCandidate(Long id_candidate);
}
