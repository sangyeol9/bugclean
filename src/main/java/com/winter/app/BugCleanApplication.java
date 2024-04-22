package com.winter.app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class BugCleanApplication {

	public static void main(String[] args) {
		SpringApplication.run(BugCleanApplication.class, args);
		System.out.println("노지언 멍청이 말미잘 맥북 테스트");
	}

}
