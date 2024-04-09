package com.winter.app.customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	@PostMapping("create")
	public String createCustomer(CustomerVO customerVO) throws Exception{
		System.out.println("진입 ");
		System.out.println("customer vo" + customerVO+ "\n종료");
		System.out.println("customer" + customerVO.getCeo_Name());
		System.out.println(customerVO.getCeo_Phone());
		customerService.createCustomer(customerVO);
		System.out.println("작업완료");
		return "redirect:/customer/list";
	}
	
	@PostMapping("update")
	public String updateCustomer(CustomerVO customerVO,Model model) throws Exception{
			int result = customerService.updateCustomer(customerVO);
			model.addAttribute("result", result);
			
		return "/ajax/result";
	}
	
	@GetMapping("detail")
	public String getDetail(CustomerVO customerVO,Model model) throws Exception{
		CustomerVO vo = customerService.getDetail(customerVO);
		
		model.addAttribute("vo", vo);
		
		return "/customer/detail";
	}
	
}
