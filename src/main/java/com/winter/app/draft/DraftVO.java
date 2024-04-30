package com.winter.app.draft;




import lombok.Data;

@Data
public class DraftVO {

	private String draft_num;
	private String employee_num;
	private String draft_date;
	private String title;
	private String contents;
	private Long state;
	private Long draft_category;
	private Long now_approval;
}
