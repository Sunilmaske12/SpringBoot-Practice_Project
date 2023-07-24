package com.springBoot.jsp.OES.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springBoot.jsp.OES.dao.ChatRepository;
import com.springBoot.jsp.OES.dao.TicketRepository;
import com.springBoot.jsp.OES.entity.Chat;
import com.springBoot.jsp.OES.entity.ChatTicket;

@Service
public class ContactServicesImpl implements ContactServices {
	
	@Autowired
	private ChatRepository chatRepository;
	
	@Autowired
	private TicketRepository ticketRepository;
	
	@Override
	public List<ChatTicket> getChatByUserId(int id) {
		return ticketRepository.findByUserId(id);
	}

	@Override
	public List<Chat> getAllChatsById(String tid) {
		return   chatRepository.findByTicketid(tid);
	}

	@Override
	public int getNewQueryCount() {
		
		return  ticketRepository.countBySeen("No") ;
	}

}
