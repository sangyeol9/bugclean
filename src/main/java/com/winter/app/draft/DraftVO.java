package com.winter.app.draft;

import java.util.Date;

import lombok.Data;

@Data
public class DraftVO {

	private String doc_num;
	private String employee_num;
	private Date  draft_date;
	private String title;
	private String contents;
	private Long state;
	private Long draft_category;
}
