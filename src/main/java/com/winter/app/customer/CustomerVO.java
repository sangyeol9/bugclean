package com.winter.app.customer;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;


@Data
public class CustomerVO {
	
	//시퀀스 pk -- 필요한가?..
	private Long customer_Num;
	// 사업자 번호
	private String business_Num;
	// 사업자명
	private String business_Name;
	// 사장 이름
	private String ceo_Name;
	// 사장 폰
	private String ceo_Phone;
	// 거래처 담당자 이름
	private String manager_Name;
	// 거래처 담당자 번호
	private String manager_Phone;
	// 사업자 주소
	private String address;
	//우리 회사 영업 담당자 이름
	private String sales_Manager;
	//법인,개인
	private String customer_Type;
	//날짜 -- 필요한가 ? sysdate쓰는데
	private Timestamp date;
	// 계약상태 -- 진행중 or 중단
	private String contract_Type;
		
}
