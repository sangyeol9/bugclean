package com.winter.app.chat;

import java.util.HashSet;
import java.util.Set;

import org.springframework.web.socket.WebSocketSession;

import lombok.Builder;
import lombok.Data;

@Data
public class ChatRoom {

	private Long room_Num;
	private Set<WebSocketSession> sessions = new HashSet<>();
	
	@Builder
	public ChatRoom(Long room_Num) {
		this.room_Num = room_Num;
	}
	
	public void handlerActions(WebSocketSession session, ChatMessage chatMessage, ChatService chatService) {
		if(chatMessage.getType().equals(ChatMessage.MessageType.ENTER)) {
			sessions.add(session);
			chatMessage.setMsg_Contents(chatMessage.getEmployee_Num()+"님이 입장했습니다.");
		}
		sendMessage(chatMessage, chatService);
	}
	
	
	private <T> void sendMessage(T message, ChatService chatService) {
		sessions.parallelStream()
				.forEach(session -> chatService.sendMessage(session,message));
	}
	
}
