package com.winter.app.customer;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;


@Data
public class CustomerVO {
	
	//시퀀스 pk
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
	// 사업자 구분 == 법인 사업자인지 개인 사업자인디
	private String customer_Kind;
	//우리 회사 영업 담당자 사번, 사번으로 이름 조회해서 뿌려주기
	private String employee_Num;
	private String employee_Name;
	
	//사업자 인지 개인 거래처인지
	private String customer_Type;
	//날짜 -- 필요한가 ? sysdate쓰는데
	private Timestamp first_Contract_Date;
	// 계약상태 -- 진행중 or 중단
	private String contract_Type;
		
}
