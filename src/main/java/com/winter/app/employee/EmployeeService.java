package com.winter.app.employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EmployeeService {

	@Autowired
	private EmployeeDAO employeeDAO;
	private final JavaMailSender javaMailSender;
    private static final String senderEmail= "arark057@gmail.com";
    private static int number;
	
	public int sendMail(String mail) {
		MimeMessage message = CreateMail(mail);
		javaMailSender.send(message);
		
		System.out.println("message : "+message);
		
		return number;
	}
	
	public static void createNumber(){
        number = (int)(Math.random() * (90000)) + 100000;// (int) Math.random() * (최댓값-최소값+1) + 최소값
    }
	
	public MimeMessage CreateMail(String mail){
        createNumber();
        MimeMessage message = javaMailSender.createMimeMessage();

        try {
            message.setFrom(senderEmail);
            message.setRecipients(MimeMessage.RecipientType.TO, mail);
            message.setSubject("이메일 인증");
            String body = "";
            body += "<h3>" + "인증 코드를 발급하였습니다." + "</h3>";
            body += "<h1>" + number + "</h1>";
            body += "<h3>" + "위 인증 코드를 입력하여 주세요. 감사합니다." + "</h3>";
            message.setText(body,"UTF-8", "html");
        } catch (MessagingException e) {
            e.printStackTrace();
        }

        return message;
    }
	
}
