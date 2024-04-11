package com.winter.app.employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/employee/*")
public class EmployeeController {

	@Autowired
	private EmployeeService employeeService;
	
	@GetMapping("login")
	public void login(@ModelAttribute EmployeeVO employeeVO) throws Exception{
		
	}
	
	@GetMapping("create")
	public void create(@ModelAttribute EmployeeVO employeeVO) throws Exception{
		
	}
	@PostMapping("create")
	public String create(@Validated(EmployeeCreateGroup.class) EmployeeVO employeeVO, BindingResult bindingResult,Model model) throws Exception{
		
		System.out.println("Member Add");
		//System.out.println("error : "+bindingResult);
		
		boolean check = employeeService.checkEmployee(employeeVO, bindingResult);
		if(check) {
			return "member/add";
		}
		
		
		
		
		return null;
		
	}
	@PostMapping("mailCheck")
	public String mailCheck(String mail) {
		System.out.println("이메일 인증 요청");
		System.out.println("이메일 인증 이메일 : " + mail);
		
		int number = employeeService.sendMail(mail);
		
		String num = ""+number;
		
		return num;
	}
	
	@GetMapping("mypage")
	public void mypage() throws Exception{
		
	}
	
	@GetMapping("idSearch")
	public void idFind() throws Exception{
		
	}
	@GetMapping("pwSearch")
	public void pwFind() throws Exception{
		
	}
	
	@GetMapping("inbox")
	public void getInbox() throws Exception{
		
	}
	
	@GetMapping("sample1")
	public void sample() throws Exception{
		
	}
	@GetMapping("sample2")
	public void sample2() throws Exception{
		
	}
}
