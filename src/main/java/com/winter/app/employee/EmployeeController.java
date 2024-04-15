package com.winter.app.employee;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/employee/*")
public class EmployeeController {

	@Autowired
	private EmployeeService employeeService;
	private int number;
	
	@GetMapping("login")
	public void login(@ModelAttribute EmployeeVO employeeVO) throws Exception{
		
		return;
	}
	
	//가입
	@GetMapping("create")
	public void create(@ModelAttribute EmployeeVO employeeVO) throws Exception{
		
	}
	@PostMapping("create")
	public String create(@Validated(EmployeeCreateGroup.class) EmployeeVO employeeVO, BindingResult bindingResult,Model model) throws Exception{
		
		System.out.println("Member Add");
		//System.out.println("error : "+bindingResult);
		String username= employeeVO.getUsername();
		employeeVO.setUsername(username+"@gmail.com");
		
		boolean check = employeeService.checkEmployee(employeeVO, bindingResult);
		if(check) {
			return "employee/create";
		}
		
		int result = employeeService.create(employeeVO);
		model.addAttribute("result", "employee.create.result");
		model.addAttribute("path","/");

		return "commons/result";
	}
	//이메일 인증
	@PostMapping("mailSend")
	@ResponseBody
	public String mailSend(String email) {
		System.out.println("Mail:"+email);
		
		
		number = employeeService.sendMail(email);

        String num = "" + number;

        System.out.println("num:"+num);
        return num;
        
    }
	// 인증번호 일치여부 확인
    @GetMapping("mailCheck")
    @ResponseBody
    public ResponseEntity<?> mailCheck(@RequestParam String userNumber) {
    	System.out.println(userNumber);
        boolean isMatch = userNumber.equals(String.valueOf(number));

        return ResponseEntity.ok(isMatch);
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
