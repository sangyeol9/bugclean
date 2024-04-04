package com.winter.app.schedule;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.winter.app.customer.CustomerController;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/schedule")
@Slf4j
public class ScheduleController {

	@GetMapping("list")
	public void getList() throws Exception {
		
		
	}
	
}
