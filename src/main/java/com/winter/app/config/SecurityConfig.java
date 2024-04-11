package com.winter.app.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.RequestMatcher;

@Configuration
@EnableWebSecurity //내설정
public class SecurityConfig {
	
	@Bean
	PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	WebSecurityCustomizer webSecurityCustomizer() {
		return web -> web
				.ignoring()
				.requestMatchers("/css/**")
				.requestMatchers("/js/**")
				.requestMatchers("/vendor/**")
				.requestMatchers("/img/**")
				.requestMatchers("/favicon/**");
	}
	
	@Bean
	SecurityFilterChain filterChain (HttpSecurity security) throws Exception{
				//권한 설정
		security.authorizeHttpRequests(
				(authorizeHttpRequests) -> authorizeHttpRequests
											.requestMatchers("/").authenticated()
											.requestMatchers("/employee/login").permitAll()
											.requestMatchers("/employee/idSearch").permitAll()
											.requestMatchers("/employee/pwSearch").permitAll()
											.requestMatchers("/employee/create").permitAll()
											.requestMatchers("/employee/mailSend").permitAll()
											.requestMatchers("/employee/mailCheck").permitAll()
											.anyRequest().permitAll()
											//.anyRequest().authenticated()//나머지
		)
		.csrf(csrf -> csrf
	            .ignoringRequestMatchers("/employee/mailSend")
	    )
		
		
		//내로그인폼
		.formLogin(
				(login)->login
						.loginPage("/employee/login")
						.defaultSuccessUrl("/")
						.failureUrl("/employee/login")
						.permitAll()
		);
		
		return security.build();
	}
	
}
