package com.winter.app.sitesch;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class SiteSchVO {
	
	private Long site_Num;
	private Long customer_Num;
	private Long price;
	private Timestamp start_Time;
	private Timestamp end_Time;
	private String employee_Num;
	private Long manage_Code;
	private Long draft_Num;
	private String site_Type;
	// 캘린더 제목 // 회사명 + 사장명 
	private String ceo_Name;
	private String business_Name;
	
}
