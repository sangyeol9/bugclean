package com.winter.app.draft;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.winter.app.employee.DepartmentVO;
import com.winter.app.employee.EmployeeVO;
import com.winter.app.employee.PositionVO;
import com.winter.app.employee.RnRVO;


@Controller
@RequestMapping("/draft/*")
public class DraftController {
	@Autowired
	private DraftService draftService;
	
	
	@GetMapping("basisdraft")
	public String getBasisDraft(Map<String, Object> map, Model model)throws Exception {
		EmployeeVO employeeVO = new EmployeeVO();
		DepartmentVO departmentVO = new DepartmentVO();
		PositionVO positionVO = new PositionVO();
		RnRVO rnrVO = new RnRVO();
		map.put("emp", employeeVO);
		map.put("dep", departmentVO);
		map.put("pos", positionVO);
		map.put("rnr", rnrVO);
		 List<Map<String, Object>> ar = draftService.getBasisDraft();
		 System.out.println(ar.toString());
		 model.addAttribute("list", ar);
		 List<DepartmentVO> depar = draftService.getDepartmentList();
		 model.addAttribute("dep", depar);
		 DraftVO draftVO= draftService.getDraftDocNum();
		 model.addAttribute("draftVO", draftVO);
		return "/draft/basisdraft";
	}
	
	@PostMapping("getapprovalline")
	public void getApprovalLine() {
		
	}
	
	
	
	@GetMapping("draftLine")
	public void getDraftLine()throws Exception{
		
	}
	
	@GetMapping("draftlist")
	public void getDraftList()throws Exception {
		
	}
	
	@GetMapping("mydraftlist")
	public void getMyDraftList()throws Exception{
		
	}
	@GetMapping("myrejectiondraftlist")
	public void getMyReJectionList()throws Exception {
		
	}
	@GetMapping("myapprovinglist")
	public void getMyApprovingList()throws Exception {
		
	}
	@GetMapping("myapprovedlist")
	public void getMyApprovedList()throws Exception {
		
	}
	@GetMapping("mytemporarylist")
	public void getMyTemporaryList()throws Exception {
		
	}
	
}
