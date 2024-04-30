package com.winter.app.chat;

import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

import org.springframework.web.socket.WebSocketSession;

import lombok.Builder;
import lombok.Data;

@Data
public class ChatRoom {

	private String room_num;
	private String name;
	private Set<WebSocketSession> sessions = new HashSet<>();
	
	public static ChatRoom create(String name,String room_num) {
		ChatRoom chatRoom = new ChatRoom();
		chatRoom.room_num = room_num;
		chatRoom.name = name;
		return chatRoom;
		
	}
	
	

	
	
	
	
}
