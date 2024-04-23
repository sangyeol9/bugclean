package com.winter.app.chat;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class ChatMessage {
	
	public enum MessageType{
		ENTER, TALK
	}
	 
	// 접속 알림 메시지인지 ,대화 내용인지 구분
	private MessageType type;
	private String roomId;
	private String sender;
	private String message;
	
	
}
