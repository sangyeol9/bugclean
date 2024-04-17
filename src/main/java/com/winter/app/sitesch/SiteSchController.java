package com.winter.app.sitesch;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.winter.app.customer.CustomerController;
import com.winter.app.employee.EmployeeVO;

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
	public void list(Model model ) throws Exception{
		List<EmployeeVO> ar = schService.getSales();
		List<EmployeeVO> ar_emp = schService.getSiter();
		
		
		model.addAttribute("list", ar);
		model.addAttribute("list_emp", ar_emp);
		
	}
	
	@PostMapping("create")
	@ResponseBody
	public int createSchedule(@RequestBody SiteSchVO schVO) throws Exception{
		System.out.println("schVO ==== " + schVO);
		int result = schService.createSch(schVO);
		return result;
	}
	
	@PostMapping("getSchedule")
	@ResponseBody
	public SiteSchVO getSchedule(@RequestBody SiteSchVO schVO) throws Exception{
		SiteSchVO result = schService.getSchedule(schVO);
		
		
		return result;
	}
	
//	@PostMapping("getSales")
//	@ResponseBody
//	public List<EmployeeVO> getSales(@RequestBody EmployeeVO employeeVO) throws Exception{
//		System.out.println(" name =  "+employeeVO.getName());
//		
//		List<EmployeeVO> ar = schService.getSales(employeeVO);
//		
//		
//		//리스트 받아왔고 이거를 패치로 div에 사원번호 뿌려주기 
//		
//		return ar;
//	}
	
	
}
