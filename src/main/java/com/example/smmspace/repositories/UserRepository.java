package com.example.smmspace.repositories;

import com.example.smmspace.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByEmail(String email);
    User findByActivationCode(String code);
    User findByForgotCode(String code);
}
