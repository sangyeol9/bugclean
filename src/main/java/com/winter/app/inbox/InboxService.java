package com.winter.app.inbox;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.winter.app.draft.DraftFileVO;
import com.winter.app.draft.DraftVO;
import com.winter.app.employee.EmployeeService;
import com.winter.app.employee.EmployeeVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class InboxService {
	@Autowired
	private InboxDAO inboxDAO;

	public List<Map<String, Object>> getAllList(EmployeeVO employeeVO) throws Exception {
//		List<Map<String, Object>> getAllList = inboxDAO.getAllList(employeeVO);
//		for(Map ar: getAllList) {
//			System.out.println(ar.get("DRAFT_DATE").toString().split(" "));
//		}
//		
//		for(Map<String, Object> ar: getAllList) {
//		    String draftDate = (String) ar.get("DRAFT_DATE");
//		    if (draftDate != null && !draftDate.isEmpty()) {
//		        String[] splitDate = draftDate.split(" ");
//		        System.out.println(Arrays.toString(splitDate));
//		    }
//		}

		return inboxDAO.getAllList(employeeVO);
	}
	public List<Map<String, Object>> getWaitList(EmployeeVO employeeVO) throws Exception {
		return inboxDAO.getWaitList(employeeVO);
	}
	public List<Map<String, Object>> getProgressList(EmployeeVO employeeVO) throws Exception {
		return inboxDAO.getProgressList(employeeVO);
	}
	public List<Map<String, Object>> getDoneList(EmployeeVO employeeVO) throws Exception {
		return inboxDAO.getDoneList(employeeVO);
	}
	public List<Map<String, Object>> getReferList(EmployeeVO employeeVO) throws Exception {
		return inboxDAO.getReferList(employeeVO);
	}
	
}
