package com.winter.app.employee;

import java.sql.Date;

import lombok.Data;

@Data
public class EmployeeVO {
	private Long employeeNum;
	private Integer depCode;
	private Integer posCode;
	private Integer rnrCode;
	private Integer typeCode;
	private String username;
	private String password;
	private String passwordCheck;
	private String name;
	private String phone;
	private String address;
	private String nickname;
	private Date joinDate;
	private Date retiredDate;
	private Integer levelDate;
	private String state;
	private String signFile;
	private String profile;
	private String profileName;
	private Long managerNum;
	
	
	
	
}
