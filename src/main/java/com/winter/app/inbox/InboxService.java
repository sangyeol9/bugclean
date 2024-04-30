package com.winter.app.inbox;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.winter.app.employee.EmployeeService;
import com.winter.app.employee.EmployeeVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class InboxService {
	@Autowired
	private InboxDAO inboxDAO;

	public List<Map<String, Object>> getInbox(EmployeeVO employeeVO) throws Exception {
		List<Map<String, Object>> allList = inboxDAO.getAllList(employeeVO);
//		List<Map<String, Object>> waitList = inboxDAO.getWaitList();
//		List<Map<String, Object>> progressList = inboxDAO.getProgressList();
//		List<Map<String, Object>> referListist = inboxDAO.getReferList();
		
		return allList;
	}
	
	
}
