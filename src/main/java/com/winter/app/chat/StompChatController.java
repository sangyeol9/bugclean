package com.winter.app.chat;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class StompChatController {

	private final SimpMessagingTemplate template;
	
	@MessageMapping(value = "/chat/enter")
	public void enter(ChatMessage message) {
		
	}
	
	@MessageMapping(value = "/chat/message")
	public void message(ChatMessage message) {
		template.convertAndSend("/sub/chat/room/"+ message.getRoom_num(), message);
	}
	
	
}
