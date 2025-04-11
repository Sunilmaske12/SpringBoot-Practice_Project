package com.sunil.SCM2.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sunil.SCM2.entity.User;

@Repository
public interface UserRepo extends JpaRepository<User, String>  {
	
	User findByEmail(String email);

}
