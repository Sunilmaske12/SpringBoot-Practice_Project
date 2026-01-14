package com.sunil.SCM2.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sunil.SCM2.entity.User;

import java.util.Optional;

@Repository
public interface UserRepo extends JpaRepository<User, String>  {

	Optional<User> findByEmail(String email);

	User findByEmailToken(String emailToken);

}
