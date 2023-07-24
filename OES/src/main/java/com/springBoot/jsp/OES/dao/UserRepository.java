package com.springBoot.jsp.OES.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.springBoot.jsp.OES.entity.User;

public interface UserRepository extends JpaRepository<User, Integer> {
	
	@Query("select u from User u where u.user_emailid =:email")
	public User getUserByUserName(@Param("email") String email);
	
//	@Query("select COUNT(*) form User u where u.seen=='no'")
//	public int getNewUserCount();

	public int countBySeen(String string);

}
