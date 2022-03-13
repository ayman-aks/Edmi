package com.edmi.project.repository;

import com.edmi.project.myclass.PasswordToken;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PasswordTokenRepository extends CrudRepository<PasswordToken,Long> {
    PasswordToken findByConfirmationToken(String confirmationToken);

}
