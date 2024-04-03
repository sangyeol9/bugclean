package com.winter.app.customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/customer")
@Slf4j
public class CustomerController {

		
	@Autowired
	CustomerService customerService;
	
	@GetMapping("list")
	public String getList(Model model) throws Exception{
		var list = customerService.getList();
		
		model.addAttribute("list", list);
		
		return "/customer/list";
	}
	
	@GetMapping("create")
	public void createCustomer() throws Exception{
		
	}
	
}
