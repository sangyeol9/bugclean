package com.winter.app.chat;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.winter.app.employee.DepartmentVO;

import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class ChatService {
	
	@Autowired
	ChatDAO chatDAO;
	
	/*
	 * private final ObjectMapper objectMapper = new ObjectMapper(); private
	 * Map<String,ChatRoom> chatRooms;
	 * 
	 * 
	 * @PostConstruct private void init() { chatRooms = new LinkedHashMap<>(); }
	 * 
	 * public List<ChatRoom> findAllRoom(){ return new
	 * ArrayList<>(chatRooms.values()); }
	 * 
	 * public ChatRoom findRoomById(String roomId) { return chatRooms.get(roomId); }
	 * 
	 * // 수정 테스트중 public ChatRoom createRoom(String name) { String randomId =
	 * UUID.randomUUID().toString(); ChatRoom chatRoom = ChatRoom.builder()
	 * .roomId(randomId) .name(name) .build(); chatRooms.put(randomId, chatRoom);
	 * return chatRoom; }
	 * 
	 * public <T> void sendMessage(WebSocketSession session, T message) { try {
	 * session.sendMessage(new
	 * TextMessage(objectMapper.writeValueAsString(message))); } catch (Exception e)
	 * { log.error(e.getMessage(),e); } }
	 */
	
	
	
	public List<Map<String, Object>> getEmployeeList() throws Exception{
		
		return chatDAO.getEmployeeList();
	}
	
	public List<DepartmentVO> getDepartment() throws Exception{
		
		return chatDAO.getDepartment();
	}
	
}
