package com.winter.app.inbox;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.winter.app.employee.EmployeeController;
import com.winter.app.employee.EmployeeVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/receive/*")
@Slf4j
public class InboxController {
	@Autowired
	private InboxService inboxService;
	
	@GetMapping("inbox")
	public String getInbox(Model model) throws Exception{
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails= (UserDetails)principal;
		
		EmployeeVO employeeVO = (EmployeeVO)userDetails;
		
		List<Map<String, Object>> allList = inboxService.getInbox(employeeVO);
		
		System.out.println("allList : "+allList);
		
		model.addAttribute("allList", allList);
		
		return "employee/inbox";
	}
}
