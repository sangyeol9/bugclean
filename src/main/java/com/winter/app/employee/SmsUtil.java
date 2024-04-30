package com.winter.app.employee;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


@Component
@ComponentScan
@Slf4j
public class SmsUtil{
	@Value("${coolsms.api.key}")
    private String apiKey;
    @Value("${coolsms.api.secret}")
    private String apiSecretKey;
	@Value("${coolsms.dev.fromnumber}")
	private String fromNumber;
	@Value("${app.upload.profile}")
	private String uploadPath;
	
								//보낼 폰번호 , 랜덤번호
	public void sendMessage(String toNumber, String randomNumber) {
		System.out.println("apiSecretKey: "+apiSecretKey);
		System.out.println("uploadPath: "+uploadPath);
		//변환
		toNumber.replaceAll("-","");
        
		Message coolsms = new Message(apiKey, apiSecretKey);
		
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", toNumber); //수신 번호
		params.put("from", fromNumber); //발신번호
		params.put("type", "SMS");  // 문자 타입
		params.put("text", "[BugClean] 인증번호 "+randomNumber+" 를 입력하세요.");
		params.put("app_version", "test app 1.2"); // application name and version
		
		try {
			JSONObject obj = (JSONObject) coolsms.send(params); //보내기&전송결과받기
			System.out.println("obj : "+obj.toString());
		} catch (CoolsmsException e) {
			System.out.println("getMessage : "+e.getMessage());
			System.out.println("getCode : "+e.getCode());
		}
	}
}

