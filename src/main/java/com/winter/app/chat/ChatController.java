	package com.winter.app.chat;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@GetMapping("/room")
	public void openRoom() {
		
	}
	
	//방 생성
	@PostMapping("create")
	@ResponseBody
	public ChatRoom createRoom(@RequestBody Long room_Num) {
		return chatService.createRoom(room_Num);
	}
	@GetMapping
	public List<ChatRoom> findAllRoom(){
		return chatService.findAllRoom();
	}
	
	@PostMapping("list")
	@ResponseBody
	public List<Map<String, Object>> getEmployeeList() throws Exception {
		
		List<Map<String, Object>> list = chatService.getEmployeeList();
		
		System.out.println(list);
		
		return list;
	}
	
	@PostMapping("department")
	@ResponseBody
	public List<DepartmentVO> getDepartment() throws Exception{
		
		List<DepartmentVO> ar = chatService.getDepartment();
		return ar;
	}
	
}
