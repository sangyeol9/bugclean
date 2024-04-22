package com.winter.app.draft;

import java.awt.Dialog.ModalExclusionType;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.winter.app.employee.DepartmentVO;
import com.winter.app.employee.EmployeeVO;
import com.winter.app.employee.PositionVO;
import com.winter.app.employee.RnRVO;

import jakarta.servlet.http.HttpSession;


@Controller
@RequestMapping("/draft/*")
public class DraftController {
	@Autowired
	private DraftService draftService;
	
	
	@GetMapping("basisdraft")
	public String getBasisDraft(Map<String, Object> map, Model model, HttpSession session)throws Exception {
		EmployeeVO employeeVO = new EmployeeVO();
		employeeVO.setEmployee_num("2024001");
		Map<String, Object> empMap = draftService.getEmployeeDetail(employeeVO);
		System.out.println("empMap@@@@@@@@@@@@@@@ : "+empMap.toString());
		model.addAttribute("empMap", empMap);
		 List<Map<String, Object>> ar = draftService.getBasisDraft();
		 System.out.println(ar.toString());
		 model.addAttribute("list", ar);
		 List<DepartmentVO> depar = draftService.getDepartmentList();
		 model.addAttribute("dep", depar);
		 DraftVO draftVO= draftService.getDraftDocNum();
		 model.addAttribute("draftVO", draftVO);
		 List<DepartmentVO> depHighAr = draftService.getDepartmentHighList();
		 model.addAttribute("depHighAr", depHighAr);
		 System.out.println("depHighAr: " + depHighAr );
		 employeeVO = draftService.getCEO();
		 model.addAttribute("CEO", employeeVO);
		 
		 
		return "draft/basisdraft";
	}
	
	@PostMapping("getapprovalline")
	public String getApprovalLine(String [] dep, String [] name, String [] orgCode, String [] refCode, Map<String, Object> map, Model model, HttpSession session)throws Exception {
		
		model.addAttribute("aplvdep", dep);
		model.addAttribute("aplvname", name);
		EmployeeVO employeeVO = new EmployeeVO();
		employeeVO.setEmployee_num("2024001");
		Map<String, Object> empMap = draftService.getEmployeeDetail(employeeVO);
		System.out.println("empMap@@@@@@@@@@@@@@@ : "+empMap.toString());
		model.addAttribute("empMap", empMap);
		 List<Map<String, Object>> ar = draftService.getBasisDraft();
		 System.out.println(ar.toString());
		 model.addAttribute("list", ar);
		 List<DepartmentVO> depar = draftService.getDepartmentList();
		 model.addAttribute("dep", depar);
		 DraftVO draftVO= draftService.getDraftDocNum();
		 model.addAttribute("draftVO", draftVO);
		 List<DepartmentVO> depHighAr = draftService.getDepartmentHighList();
		 model.addAttribute("depHighAr", depHighAr);
		 System.out.println("depHighAr: " + depHighAr );
		 employeeVO = draftService.getCEO();
		 model.addAttribute("CEO", employeeVO);		 

//		 draftService.setApprovalLine(code, empMap);
		List<Map<String, Object>> ALar = draftService.setApprovalLine(orgCode, empMap);
		model.addAttribute("approvalMap", ALar);

		 
		return "ajax/approvalline";
	}
	
	@PostMapping("getaplist")
	public String getAPList(String [] empCode,String lineName, Model model)throws Exception{
		EmployeeVO employeeVO = new EmployeeVO();
		employeeVO.setEmployee_num("2024001");
		Map<String, Object> empMap = draftService.getEmployeeDetail(employeeVO);
		System.out.println("empMap@@@@@@@@@@@@@@@ : "+empMap.toString());
		model.addAttribute("empMap", empMap);

		System.out.println("line_name : "+lineName.toString());
		 for(int i=0; i<empCode.length;i++) {
			System.out.println("empCode : "+empCode[i]); 
		 }
		 	
		 List<Map<String, Object>> ALar = draftService.setApprovalLine(empCode, empMap);
		 APListVO apListVO = new APListVO();
		 Long approval_line_code = Long.parseLong(ALar.get(0).get("APPROVAL_LINE_CODE").toString());
		 apListVO.setApproval_line_code(approval_line_code);
		 
		 String employee_num = ALar.get(0).get("EMPLOYEE_NUM").toString();
		apListVO.setEmployee_num(employee_num);
		apListVO.setLine_name(lineName);
		List<APListVO> ar = draftService.setAPList(apListVO);
		model.addAttribute("allist", ar);

		 return "ajax/approvalline";
		
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
