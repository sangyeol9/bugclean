package com.winter.app.config;

import java.io.IOException;
import java.net.URLEncoder;

import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class LoginFailHandler implements AuthenticationFailureHandler{
	
	@Override
		public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
				AuthenticationException exception) throws IOException, ServletException {
			System.out.println("로그인 실패 확인 ==>"+exception);
			
			String message = "";
			
			if(exception instanceof InternalAuthenticationServiceException) {
				message="없는 계정입니다. 사원등록을 해주세요.";
			}
			
			if(exception instanceof BadCredentialsException) {
				message="비밀번호를 확인해주세요.";
			}
			if(exception instanceof AccountExpiredException) {
				message="계정 유효기간 만료";
			}
			if(exception instanceof LockedException) {
				message="잠금된 계정입니다.";
			}
			if(exception instanceof CredentialsExpiredException) {
				message="비밀번호 유효기간 만료";
			}
			if(exception instanceof DisabledException) {
				message="휴면 계정입니다.";
			}
			
			/* Encoding 문제 발생시 */
			message = URLEncoder.encode(message, "UTF-8");
			
			response.sendRedirect("/employee/login?message="+message);
		}
}
