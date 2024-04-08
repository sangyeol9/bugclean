package com.winter.app.employee;

import java.sql.Date;

import lombok.Data;
@Data
public class EmployeeVO {
	private String employee_num;
	private Integer dep_code;
	private Integer pos_code;
	private Integer rnr_code;
	private Integer type_code;
	private String username;
	private String password;
	private String passwordCheck;
	private String name;
	private String phone;
	private String address;
	private String nickname;
	private Date join_date;
	private Date retired_date;
	private Integer level_date;
	private String state;
	private String sign_file;
	private String profile;
	private String profile_name;
	private Long manager_num;

}
