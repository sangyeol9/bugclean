package com.winter.app.config;

import java.io.IOException;
import java.net.URLEncoder;

import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class LoginSucessHandler implements AuthenticationSuccessHandler{
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
		Authentication authentication) throws IOException, ServletException {
		
		String rememverId = request.getParameter("rememberId");
		
		if(rememverId != null) {
			//ID Client cookie에 저장
			
			//서버쪽 쿠키 만들기
			Cookie cookie = new Cookie("rememberId", authentication.getName());
			
			cookie.setMaxAge(86400);//쿠키 최대기간 (하루)
			cookie.setPath("/");//어느 경로에 쓸건지
			
			//응답에 쿠키담아 보내깅
			response.addCookie(cookie);

		}else {
			//저장안함 쿠키지우기
			Cookie [] cookie = request.getCookies();
			
			for(Cookie c: cookie) {
				if(c.getName().equals("rememberId")) {
					//클라이언트
					c.setMaxAge(0);
					c.setValue("");
					c.setPath("/");
					//쿠키 다시보내기
					response.addCookie(c);
					break;
				}
			}
			
			
			
			
		}
		
		
		response.sendRedirect("/");
		
	}
	
	
}
