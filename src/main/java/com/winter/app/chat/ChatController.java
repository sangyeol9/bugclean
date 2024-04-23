	package com.winter.app.chat;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.winter.app.customer.CustomerController;
import com.winter.app.employee.DepartmentVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/chat")
@Slf4j
@RequiredArgsConstructor
public class ChatController {
	
	@Autowired
	ChatService chatService;
	
	private final ChatRoomRepository chatRoomRepository;
	
	
	
	@GetMapping("room")
	public String room() {
		return "/chat/room";
	}
	
	@GetMapping("rooms")
	@ResponseBody
	public List<ChatRoom> rooms(){
		return chatRoomRepository.findAllRoom();
	}
	
	//방 생성
	@PostMapping("room")
	@ResponseBody
	public ChatRoom createRoom(@RequestParam String name) {
		return chatRoomRepository.createChatRoom(name);
	}
	
	@GetMapping("room/enter/{roomId}")
	public String roomDetail(Model model, @PathVariable String roomId) {
		model.addAttribute("roomId", roomId);
		return "/chat/roomdetail";
	}
	@GetMapping("room/{roomId}")
	@ResponseBody
	public ChatRoom roomInfo(@PathVariable String roomId) {
		return chatRoomRepository.findRoomById(roomId);
	}
	
	
	
	
	//사원 리스트 가져오기
	@PostMapping("list")
	@ResponseBody
	public List<Map<String, Object>> getEmployeeList() throws Exception {
		
		List<Map<String, Object>> list = chatService.getEmployeeList();
		
		System.out.println(list);
		
		return list;
	}
	//부서 리스트 가져오기
	@PostMapping("department")
	@ResponseBody
	public List<DepartmentVO> getDepartment() throws Exception{
		
		List<DepartmentVO> ar = chatService.getDepartment();
		return ar;
	}
	
}
