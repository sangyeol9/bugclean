package com.winter.app.alert;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
@RequiredArgsConstructor
public class EchoHandler extends TextWebSocketHandler{
	// 전체 로그인 유저
		private List<WebSocketSession> sessions = new ArrayList<>();
		
	// 1대1 매핑
	private Map<String, WebSocketSession> userSessionMap = new HashMap<>();
}
