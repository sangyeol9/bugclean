package com.winter.app.chat;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.winter.app.employee.DepartmentVO;
import com.winter.app.employee.EmployeeVO;

@Mapper
public interface ChatDAO {

	int checkExistRoom(ChatRoom room) throws Exception;
	int createRoom(ChatRoom room) throws Exception;
	int inviteChatRoom(ChatMemberVO chatMemberVO) throws Exception;
	
	int sendMsg(ChatMessage chatMessage) throws Exception;
	
	List<ChatMessage> getChatList(ChatMemberVO chatMemberVO) throws Exception;
	
	List<Map<String, Object>> getEmployeeList(EmployeeVO employeeVO) throws Exception;
	
	List<DepartmentVO> getDepartment() throws Exception;
	
	Map<String, Object> getEmpInfo(EmployeeVO employeeVO) throws Exception;
	
	Map<String, Object> getEmpName(EmployeeVO employeeVO) throws Exception;
}
