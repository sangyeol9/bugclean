package com.winter.app.carManage;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CarManageVO {
	private Long manage_code;
	private Long car_code;
	private String employee_num;
	private String booking_start;
	private String booking_done;
	private Long booking_agree;
	
}
