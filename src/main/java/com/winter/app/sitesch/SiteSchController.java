package com.winter.app.sitesch;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.winter.app.customer.CustomerController;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/schedule")
@Slf4j
public class SiteSchController {
	
	@Autowired
	private SiteSchService schService;
	
	
	@GetMapping("getList")
	@ResponseBody
	public List<SiteSchVO> getList(Model model) throws Exception {
		List<SiteSchVO> ar = schService.getList();
		System.out.println("list = " + ar);
		model.addAttribute("list",ar);
		
		return ar;
		
	}
	
	@GetMapping("list")
	public void list() throws Exception{
		
	}
	
	@GetMapping("create")
	public void createSchedule() throws Exception{
		
	}
	
	
}
