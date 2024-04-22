package com.winter.app.employee;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.core.userdetails.UserDetails;
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
import org.springframework.web.multipart.MultipartFile;

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
	
	//-----------------------------로그인
	@GetMapping("login")
	public String login(@ModelAttribute EmployeeVO employeeVO, HttpSession session) throws Exception{
		
		//로그인 성공 후 뒤로 가기 시 메인홈 처리
		Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");
		//System.out.println("======obj :"+obj);
		
		if(obj == null){
			return "employee/login";
		}
		
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
		String user = contextImpl.getAuthentication().getPrincipal().toString();
		
		if(user.equals("anonymousUser")) {
			return "member/login";
		}
				
		return "redirect:/";
	}
	
	//----------------------------가입
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
	

	//----------------------------마이페이지
	@GetMapping("mypage")
	public void mypage(@ModelAttribute EmployeeVO employeeVO, HttpSession session) throws Exception{


	}

	//비밀번호 변경
	@GetMapping("pwUpdate")
	public void pwUpdate(@ModelAttribute EmployeeVO employeeVO) throws Exception{
		
	}
	@PostMapping("pwUpdate")
	public String pwUpdate(@Validated(EmployeePwupdateGroup.class)EmployeeVO employeeVO, BindingResult bindingResult, Model model) throws Exception{
		
		//System.out.println("================:"+employeeVO.getUsername());
		
		boolean check = employeeService.checkPw(employeeVO, bindingResult);
		
		if(check) {
			
			return "employee/pwUpdate";
			
		}
		
		int result = employeeService.pwUpdate(employeeVO);
		model.addAttribute("result","employee.update.success");
		model.addAttribute("path","mypage");
		
		return "commons/result";
	}
	//서명 등록,변경
	@PostMapping("signSave")
	public String signSave(@ModelAttribute EmployeeVO employeeVO,Model model, HttpSession session) throws Exception{
		System.out.println("서명파일:"+employeeVO.getEmployee_num());
		
		//db 변경
		int check = employeeService.signSave(employeeVO);
		
		
		//session 변경
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		UserDetails userDetails = (UserDetails)principal;
		
		EmployeeVO emVO=(EmployeeVO)userDetails;
		
		emVO.setSign_file(employeeVO.getSign_file());
		
		model.addAttribute("result", "employee.sign_file.result");
		model.addAttribute("path", "mypage");

		return "commons/result";
		
		
	}

	//개인정보수정
	@PostMapping("infoUpdate")
	public String infoUpdate(@ModelAttribute EmployeeVO employeeVO,Model model) throws Exception{
		 
		System.out.println(employeeVO.getAddress());
		System.out.println(employeeVO.getPhone());
		
		log.info("{}",employeeVO);
		
		
		//db 변경
		int check = employeeService.infoUpdate(employeeVO);
		
		//session 변경
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails= (UserDetails)principal;
		
		EmployeeVO emVO = (EmployeeVO)userDetails;
		
		emVO.setNickname(employeeVO.getNickname());
		emVO.setPhone(employeeVO.getPhone());
		emVO.setAddress(employeeVO.getAddress());
		
		model.addAttribute("result", "employee.sign_file.result");
		model.addAttribute("path", "mypage");

		return "commons/result";
		
		
	}
	
	//프로필 변경
	@PostMapping("profileUpdate")
	public String profileUpdate(@ModelAttribute EmployeeVO employeeVO, MultipartFile file,Model model) throws Exception{
		
		//db 변경
		int check = employeeService.profileUpdate(employeeVO, file);
		

		model.addAttribute("result", "employee.sign_file.result");
		model.addAttribute("path", "mypage");

		return "commons/result";
		
		
	}
	
	//----------------------------찾기
	@GetMapping("idSearch")
	public void idFind(@ModelAttribute EmployeeVO employeeVO) throws Exception{
		
	}
	@GetMapping("pwSearch")
	public void pwFind() throws Exception{
		
	}
	
	
	//----------------------------수신문서함,알림...?
	@GetMapping("inbox")
	public void getInbox() throws Exception{
		
	}
	
	
}
