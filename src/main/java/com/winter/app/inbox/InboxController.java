package com.winter.app.inbox;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.winter.app.employee.EmployeeController;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/receive/*")
@Slf4j
public class InboxController {

	@GetMapping("inbox")
	public String getInbox() throws Exception{
		
		return "employee/inbox";
	}
}
