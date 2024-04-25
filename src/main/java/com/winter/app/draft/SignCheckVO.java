package com.winter.app.draft;

import java.util.Date;

import lombok.Data;

@Data
public class SignCheckVO {

	private String draft_num;
	private String employee_num;
	private Long sign_rank;
	private String sign_date;
	private String sign_comment;
	private Long sign_ref;
	
}
