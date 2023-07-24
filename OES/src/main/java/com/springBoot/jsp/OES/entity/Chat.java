package com.springBoot.jsp.OES.entity;

import java.sql.Date;
import java.sql.Time;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity(name="query_chats")
public class Chat{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Chat_Id;
	private String ticketid;
	private String UserName; 
	private Date Date;
	private Time Time;
	private String Chats;
	private String Admin_Manager;
	private String Sender;
	private String Seen;
	
	
	
	public Chat() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getChat_Id() {
		return Chat_Id;
	}
	
	public void setChat_Id(int Chat_Id) {
		this.Chat_Id = Chat_Id;
	}

	public String getTicketid() {
		return ticketid;
	}

	public void setTicket_Id(String ticketid) {
		this.ticketid = ticketid;
	}

	public String getUserName() {
		return UserName;
	}

	public void setUserName(String userName) {
		UserName = userName;
	}

	public Date getDate() {
		return Date;
	}

	public void setDate(Date date) {
		Date = date;
	}

	public Time getTime() {
		return Time;
	}

	public void setTime(Time time) {
		Time = time;
	}

	public String getChats() {
		return Chats;
	}

	public void setChat(String chats) {
		Chats = chats;
	}

	public String getAdmin_Manager() {
		return Admin_Manager;
	}

	public void setAdmin_Manager(String admin_Manager) {
		Admin_Manager = admin_Manager;
	}

	public String getSender() {
		return Sender;
	}

	public void setSender(String sender) {
		Sender = sender;
	}

	public String getSeen() {
		return Seen;
	}

	public void setSeen(String seen) {
		Seen = seen;
	}
	
	
	
}
