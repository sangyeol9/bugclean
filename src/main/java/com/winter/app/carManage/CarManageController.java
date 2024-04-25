package com.winter.app.carManage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.winter.app.sitesch.SiteSchVO;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/carManage")
@Slf4j
@Controller
public class CarManageController {

	
	@Autowired
	private CarManageService carManageService;
	
	@PostMapping("carAllocation")
	@ResponseBody
	public CarManageVO carAllocation (@RequestBody CarManageVO carManageVO) throws Exception{
		carManageVO = carManageService.carAllocation(carManageVO);
		System.out.println("========= carVO \n" + carManageVO);
		
		
		return carManageVO;
	}
	
	@PostMapping("getCarNumber")
	@ResponseBody
	public CarDetailVO postMethodName(@RequestBody CarDetailVO carDetailVO) throws Exception {
		System.out.println("carDetailVo ============ \n " + carDetailVO);
		
		carDetailVO = carManageService.getCarNumber(carDetailVO);
		System.out.println("carDetailVo ============ \n " + carDetailVO);

		return carDetailVO;
	}
	
	@PostMapping("getUsableList")
	@ResponseBody
	public List<CarDetailVO> getUsableList(@RequestBody CarManageVO carManageVO) throws Exception{
		System.out.println(carManageVO);
		return carManageService.getUsableList(carManageVO);
		
	}
	
}
