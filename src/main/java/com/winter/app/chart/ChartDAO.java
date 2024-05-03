package com.winter.app.chart;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ChartDAO {

	public Long getPrice(String month) throws Exception;
}
