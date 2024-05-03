package com.winter.app.chart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChartService {

	@Autowired
	private ChartDAO chartDAO;
	
	public Long getPrice(String month) throws Exception{
		Long result = chartDAO.getPrice(month);
		if(result == null) {
			result = 0L;
		}
	return result;
	}
}
