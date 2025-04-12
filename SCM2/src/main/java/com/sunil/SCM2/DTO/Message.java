package com.sunil.SCM2.DTO;

import com.sunil.SCM2.enums.MessageType;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class Message {
	
	private String content;
	@Builder.Default
	private MessageType messageType = MessageType.blue;
	
	

}
