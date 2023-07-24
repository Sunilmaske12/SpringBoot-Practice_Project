package com.springBoot.jsp.OES.service;

import java.util.List;

import com.springBoot.jsp.OES.entity.Chat;
import com.springBoot.jsp.OES.entity.ChatTicket;

public interface ContactServices {

	List<ChatTicket> getChatByUserId(int id);

	List<Chat> getAllChatsById(String tid);

	int getNewQueryCount();

}
