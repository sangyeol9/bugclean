package com.winter.app.carManage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/carManage")
@Slf4j
@Controller
public class CarManageController {

	
	@Autowired
	private CarManageService carManageService;
	
	@PostMapping("carAllocation")
	@ResponseBody
	public int carAllocation (@RequestBody CarManageVO carManageVO) throws Exception{
		//int result = carManageService.carAllocation(carManageVO);
		System.out.println("========= carVO \n" + carManageVO);
		
		
		return 1;
	}
	
}
