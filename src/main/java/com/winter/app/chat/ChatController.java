package com.winter.app.chat;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.winter.app.customer.CustomerController;
import com.winter.app.employee.DepartmentVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/chat")
@Slf4j
public class ChatController {
	
	@Autowired
	ChatService chatService;
	
	@GetMapping("/room")
	public void openRoom() {
		
	}
	
	@PostMapping("/list")
	@ResponseBody
	public List<Map<String, Object>> getEmployeeList() throws Exception {
		
		List<Map<String, Object>> list = chatService.getEmployeeList();
		
		System.out.println(list);
		
		return list;
	}
	
	@PostMapping("/department")
	@ResponseBody
	public List<DepartmentVO> getDepartment() throws Exception{
		
		List<DepartmentVO> ar = chatService.getDepartment();
		System.out.println("ar : " + ar);
		return ar;
	}
	
}
