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
	
	private Long message_Num;
	private Long employee_Num;
	private String msg_Contents;
	private Timestamp msg_Send_Time;
	private Long room_Num;
	
	
}
