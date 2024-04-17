package com.winter.app.employee;

import java.util.Enumeration;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.context.SecurityContextImpl;
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

import jakarta.mail.Session;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/employee/*")
@Slf4j
public class EmployeeController {

	@Autowired
	private EmployeeService employeeService;
	private int number;
	
	//로그인
	@GetMapping("login")
	public void login(@ModelAttribute EmployeeVO employeeVO, HttpSession session) throws Exception{
		
		//로그인 성공 후 뒤로 가기 처리
//		Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");
//		System.out.println("======obj :"+obj);
//		
//		if(obj == null){
//			return "employee/login";
//		}
//		
//		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
		
		
		return ;
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
		model.addAttribute("path","employee/login");

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
	

	//sec 추가
	@GetMapping("mypage")
	public void mypage(HttpSession session) throws Exception{
		//유저 정보조회
			//속성명
			//Enumeration<String> e = session.getAttributeNames();
			//e.nextElement() => SPRING_SECURITY_CONTEXT
//		Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");
//		
//		SecurityContextImpl sci = (SecurityContextImpl) obj;
//		EmployeeVO employeeVO = (EmployeeVO) sci.getAuthentication().getPrincipal();
//		
//		//System.out.println("====== employeeVO :"+employeeVO);
//		SecurityContext context = SecurityContextHolder.getContext();
		
		
		
		
	}
	//비밀번호 변경 sec1 마지맘ㄱ
	
	
	
	
	
	
	
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
