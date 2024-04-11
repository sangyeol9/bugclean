package com.winter.app.employee;

import java.sql.Date;


import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.Data;
@Data
public class EmployeeVO {
	private String employee_num;
	private Integer dep_code;
	private Integer pos_code;
	private Integer rnr_code;
	private Integer type_code;
	@NotBlank(message = "아이디는 필수 입력 값입니다.", groups = EmployeeCreateGroup.class)
	private String username;
	@NotBlank(message = "비밀번호는 필수 입력 값입니다.", groups = EmployeeCreateGroup.class)
	@Pattern(regexp = "(?=.*[0-9])(?=.*[a-zA-Z])(?=.*\\W)(?=\\S+$).{10,16}", message = "비밀번호는 10~16자 영문자, 숫자, 특수문자를 사용하세요.", groups = EmployeeCreateGroup.class)
	private String password;
	@NotBlank(message = "비밀번호를 입력해주세요.", groups = EmployeeCreateGroup.class)
	private String passwordCheck;
	@NotBlank(message = "이름을 입력해주세요.", groups = EmployeeCreateGroup.class)
	private String name;
	@NotBlank(message = "전화번호를 입력해주세요.", groups = EmployeeCreateGroup.class)
	@Pattern(regexp = "^01([0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{4})+$", message = "전화번호를 올바르게 입력해주세요.", groups = EmployeeCreateGroup.class)
	private String phone;
	private String address;
	@Pattern(regexp = "^[ㄱ-ㅎ가-힣a-z0-9-_]{2,10}$", message = "닉네임은 특수문자를 제외한 2~10자리여야 합니다.")
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
