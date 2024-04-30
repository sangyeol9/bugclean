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
	private Long message_num;
	private MessageType type;
	private String writer;
	private String message;
	
	private String room_num;
	//시간이없어서 .. 추후에 윗 필드들 걷어내는 작업들 필요
	private String employee_num;
	private String msg_contents;
	private String msg_send_time;
	
}
