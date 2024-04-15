package com.winter.app.chart;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/chart")
public class ChartController {

	@GetMapping("/main")
	public void getMain() {
		
	}
	
}
