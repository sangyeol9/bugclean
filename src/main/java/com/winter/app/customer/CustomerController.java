package com.winter.app.customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/customer")
@Slf4j
public class CustomerController {

		
	@Autowired
	private CustomerService customerService;
	
	@GetMapping("list")
	public void getList() throws Exception{
		
	}
	
	@GetMapping("create")
	public void createCustomer() throws Exception{
		
	}
	
}
