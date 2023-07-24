package com.springBoot.jsp.OES.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.springBoot.jsp.OES.entity.Chat;
import com.springBoot.jsp.OES.entity.ChatTicket;
import com.springBoot.jsp.OES.securityConfig.CustomUserDetails;
import com.springBoot.jsp.OES.service.ContactServices;
import org.springframework.ui.Model;

@Controller
public class ContactHandler {
	
	@Autowired
	private ContactServices cs;
	
	@GetMapping("/User/contact")
	public String contactPage(Model m, @AuthenticationPrincipal CustomUserDetails user) {
		List<ChatTicket> chatTickets = cs.getChatByUserId(user.getId());
		m.addAttribute("tickets", chatTickets);
		return "contact";
	}
	
	@GetMapping("/User/allMyChats,{ticketId},{status}")
	public String getMyChats(@PathVariable("ticketId") int tid, @PathVariable("status") String status, Model m ) {
		List<Chat> allChats = cs.getAllChatsById(String.valueOf(tid));
		m.addAttribute("status", status);
		m.addAttribute("chats", allChats);
		return "Chat";
	}

}
