package com.winter.app.humanResource;


import java.sql.Date;

import lombok.Data;

@Data
public class AttendanceVO {
	private String employee_num;
	private Date attend_date;
    private String attend_start_time;
    private String attend_done;
    private String attend_vac;

}
