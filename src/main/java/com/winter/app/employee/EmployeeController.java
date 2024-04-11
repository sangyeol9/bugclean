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
//		employeeVO.setUsername(username+"@gmail.com");
//		
//		boolean check = employeeService.checkEmployee(employeeVO, bindingResult);
//		if(check) {
//			return "member/add";
//		}
//		
//		int result = employeeService.create(employeeVO);
		

		
		return null;
		
	}
	
	//이메일 인증
	@PostMapping("mailSend")
	public String mailSend(String email) {
		System.out.println("Mail:"+email);
		
		
		int number = employeeService.sendMail(email);

        String num = "" + number;

        System.out.println("num:"+num);
        return num;
        
//        HashMap<String, Object> map = new HashMap<>();
//
//        try {
//            number = employeeService.sendMail(email);
//            String num = String.valueOf(number);
//
//            map.put("success", Boolean.TRUE);
//            map.put("number", num);
//        } catch (Exception e) {
//            map.put("success", Boolean.FALSE);
//            map.put("error", e.getMessage());
//        }
//        
//        return map;
    }

	// 인증번호 일치여부 확인
    @GetMapping("mailCheck")
    public ResponseEntity<?> mailCheck(@RequestParam String userNumber) {

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
