package com.winter.app.sitesch;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class SiteSchVO {
	
	private Long site_Num;
	
	//회사명으로 회사번호 가져오기
	private Long customer_Num;
	
	private Long price;
	private String start_Time;
	private String end_Time;
	//현장담당자
	private String employee_Num;
	private Long manage_Code;
	private Long draft_Num;
	private String site_Type;
	//해당현장 영업담당자
	private String sales_Manager;
	private String address;
	
	// 캘린더 제목 // 회사명 + 사장명 
	private String business_Name;
	
	//회사명으로 사장 이름 가져오기
	private String ceo_Name;
	
}
