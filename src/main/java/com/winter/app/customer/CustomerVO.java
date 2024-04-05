package com.winter.app.customer;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class CustomerVO {
	
	private Long customer_Num;
	private String business_Num;
	private String business_Name;
	private String ceo_Name;
	private String ceo_Phone;
	private String manager_Name;
	private String manager_Phone;
	private String address;
	private String sales_Manager;
	private String customer_Type;
	private Date date;
	private String contract_Type;
		
}
