package com.winter.app.chat;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.winter.app.employee.DepartmentVO;

@Service
public class ChatService {
	
	@Autowired
	ChatDAO chatDAO;
	
	public List<Map<String, Object>> getEmployeeList() throws Exception{
		
		return chatDAO.getEmployeeList();
	}
	
	public List<DepartmentVO> getDepartment() throws Exception{
		
		return chatDAO.getDepartment();
	}
	
}
