package com.winter.app.employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional(rollbackFor = Exception.class)
							//유저의 정보를 가져오는 인터페이스
public class EmployeeService implements UserDetailsService{

	@Autowired
	private EmployeeDAO employeeDAO;
//	@Autowired
//	//private PasswordEncoder passwordEncoder;
	@Autowired
	private JavaMailSender javaMailSender;
	private static final String senderEmail= "arark057@gmail.com";
    private static int number;

	
	
	
	//아이디 중복, 비번 일치 여부
	public boolean checkEmployee(EmployeeVO employeeVO, BindingResult bindingResult) throws Exception{
		//check true -> 에러
		boolean check = false;
		
		check = bindingResult.hasErrors();
		
		//아이디 검증
		EmployeeVO result = employeeDAO.getDetail(employeeVO);
		if(result != null) {
			
			check=true;
			bindingResult.rejectValue("username", "employeeVO.username.equals");
		}
		
		
		//비밀번호 검증
		if(!employeeVO.getPassword().equals(employeeVO.getPasswordCheck())) {
			check=true;
			bindingResult.rejectValue("passwordCheck", "employeeVO.password.equals");
		}
		
		return check;
	}
	//사원등록
	public int create(EmployeeVO employeeVO) throws Exception{
		
		//비번 암호
		//employeeVO.setPassword(passwordEncoder.encode(employeeVO.getPassword()));
		return 0;
	}
	
	//UserDetailService
	@Override			//유저의 정보를 불러와서 UserDetails로 리턴
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		return null;
	}
	
	//메일
	// 랜덤으로 숫자 생성
    public static void createNumber() {
        number = (int)(Math.random() * (90000)) + 100000; //(int) Math.random() * (최댓값-최소값+1) + 최소값
    }

    public MimeMessage CreateMail(String mail) {
        createNumber();
        MimeMessage message = javaMailSender.createMimeMessage();

        try {
            message.setFrom(senderEmail);
            message.setRecipients(MimeMessage.RecipientType.TO, mail);
            message.setSubject("이메일 인증");
            String body = "";
            body += "<h3>" + "요청하신 인증 번호입니다." + "</h3>";
            body += "<h1>" + number + "</h1>";
            body += "<h3>" + "감사합니다." + "</h3>";
            message.setText(body,"UTF-8", "html");
        } catch (MessagingException e) {
            e.printStackTrace();
        }

        return message;
    }

    public int sendMail(String mail) {
        MimeMessage message = CreateMail(mail);
        javaMailSender.send(message);

        return number;
    }
	
}
