package com.edmi.project.repository;

import com.edmi.project.myclass.ConfirmationToken;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository("ConfirmationTokenRepository")
public interface ConfirmationTokenRepository extends CrudRepository<ConfirmationToken,Long> {
    ConfirmationToken findByConfirmationToken(String confirmationToken);

}
