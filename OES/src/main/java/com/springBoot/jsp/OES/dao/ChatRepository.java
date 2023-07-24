package com.springBoot.jsp.OES.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.springBoot.jsp.OES.entity.Chat;
public interface ChatRepository extends JpaRepository<Chat, Integer> {

	List<Chat> findByTicketid(String tid); 
	
	

}
