package com.winter.app.general;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PropertyVO {
	private long property_code;
	private long pro_category;
	private String property_name;
	private Timestamp pro_int_date;
}
