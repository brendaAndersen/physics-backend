package com.example.auth_api.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.auth_api.domain.user.User;
import java.util.Optional;


public interface UserRepository extends JpaRepository<User, String>{ // a entidade a ser manupulada e o tipo da chave primática - o ID
    Optional<User> findByEmail(String email);
}
