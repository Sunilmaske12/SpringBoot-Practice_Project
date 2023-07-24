package com.springBoot.jsp.OES.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.springBoot.jsp.OES.entity.ChatTicket;

public interface TicketRepository extends JpaRepository<ChatTicket, Integer>{
	@Query("select c from ticket_query c where c.User_Id=:uid")
	List<ChatTicket> findByUserId(@Param("uid") int id);

	int countBySeen(String string);

}
