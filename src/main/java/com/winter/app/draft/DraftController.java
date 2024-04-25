package com.winter.app.draft;

import java.awt.Dialog.ModalExclusionType;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	public String getBasisDraft(Map<String, Object> map, Model model, HttpSession session, MultipartFile attach)throws Exception {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails)principal;
		EmployeeVO employeeVO=(EmployeeVO)userDetails;

		Map<String, Object> empMap = draftService.getEmployeeDetail(employeeVO);
		model.addAttribute("empMap", empMap);
		System.out.println("empMap emp_num : " + empMap.get("EMPLOYEE_NUM"));
		
		
		 List<Map<String, Object>> ar = draftService.getBasisDraft();
		 model.addAttribute("list", ar);
		 
		 
		 List<DepartmentVO> depar = draftService.getDepartmentList();
		 model.addAttribute("dep", depar);
		 
		 
		 DraftVO draftVO= draftService.getDraftDocNum();
		 model.addAttribute("draftVO", draftVO);
		 
		 
		 List<DepartmentVO> depHighAr = draftService.getDepartmentHighList();
		 model.addAttribute("depHighAr", depHighAr);

//		 employeeVO = draftService.getCEO();
//		 model.addAttribute("CEO", employeeVO);
		 
		 System.out.println("empMap emp_num : " + employeeVO.getEmployee_num());
		 APListVO apListVO = new APListVO();
		 apListVO.setEmployee_num(employeeVO.getEmployee_num());
		 List<APListVO>allist = draftService.getAPList(apListVO);	
		 model.addAttribute("allist", allist);
		 
		 
		 
		return "draft/basisdraft";
	}
	
	@PostMapping("setbasisdraft")
	public void setBasisDraft(DraftVO draftVO,MultipartFile attach,Model model, String [] refempnum,String [] approvalemp_num, Long [] sign_rank)throws Exception {
		System.out.println("draftVO : " + draftVO.toString());
		System.out.println("attach : " + attach.toString());
		System.out.println("refempnum[0] : " + refempnum[0]);
		System.out.println("approvalemp_num.legth : "+ approvalemp_num.length);
		
		for(int i=0; i<approvalemp_num.length;i++) {
			 System.out.println("approvalemp_num : "+approvalemp_num[i]);
			 System.out.println("sign_rank : "+sign_rank[i]);
		}
		int result  = draftService.setBasisDraft(draftVO);
		List<SignCheckVO> SCAr = new ArrayList<SignCheckVO>();
		
	 	 draftService.setSignCheck(SCAr, approvalemp_num, sign_rank,draftVO);
		
	
		
	}
	
	@PostMapping("getapprovalline")
	public String getApprovalLine(String [] dep, String [] name, String [] orgCode, String [] refCode, Map<String, Object> map, Model model, HttpSession session)throws Exception {
		
//		model.addAttribute("aplvdep", dep);
//		model.addAttribute("aplvname", name);
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails)principal;
		EmployeeVO employeeVO=(EmployeeVO)userDetails;
		Map<String, Object> empMap = draftService.getEmployeeDetail(employeeVO);
		model.addAttribute("empMap", empMap);
		System.out.println("empMap emp_num(getapprovalLine) : " + empMap.get("EMPLOYEE_NUM"));
		
		 List<Map<String, Object>> ar = draftService.getBasisDraft();
		 model.addAttribute("list", ar);
		 
		 List<DepartmentVO> depar = draftService.getDepartmentList();
		 model.addAttribute("dep", depar);
		 
		 DraftVO draftVO= draftService.getDraftDocNum();
		 model.addAttribute("draftVO", draftVO);
		 
		 List<DepartmentVO> depHighAr = draftService.getDepartmentHighList();
		 model.addAttribute("depHighAr", depHighAr);
		 
//		 employeeVO = draftService.getCEO();
//		 model.addAttribute("CEO", employeeVO);		 

		List<Map<String, Object>> ALar = draftService.setApprovalLine(orgCode, empMap);
		model.addAttribute("approvalMap", ALar);
		System.out.println("empMap emp_num(getapprovalLine) : " + empMap.get("EMPLOYEE_NUM"));
		System.out.println("empMap emp_num(getapprovalLine) : " + employeeVO.getEmployee_num());
		 APListVO apListVO = new APListVO();
		 apListVO.setEmployee_num(employeeVO.getEmployee_num());
		 List<APListVO>allist = draftService.getAPList(apListVO);
		 model.addAttribute("allist", allist);
		 
		return "ajax/approvalline";
	}
	
	// 즐겨찾기에 저장 버튼을 눌렀을때 실행하는 메서드 
	//(approval_line테이블에 값 넣어놓고 al_Line테이블에 값 넣어놓고 넣어둔 값 다시 꺼내오는 역할)
	@PostMapping("getaplist")
	public String getAPList(String [] empCode,String lineName, Model model)throws Exception{
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails)principal;
		EmployeeVO employeeVO=(EmployeeVO)userDetails;
		
		Map<String, Object> empMap = draftService.getEmployeeDetail(employeeVO);
		model.addAttribute("empMap", empMap);
		System.out.println("empMap emp_num(getaplist) : " + empMap.get("EMPLOYEE_NUM"));
		 List<Map<String, Object>> ar = draftService.getBasisDraft();
		 model.addAttribute("list", ar);
		 
		 List<DepartmentVO> depar = draftService.getDepartmentList();
		 model.addAttribute("dep", depar);
		 
		 DraftVO draftVO= draftService.getDraftDocNum();
		 model.addAttribute("draftVO", draftVO);
		 
///////////////////////////////////////////////////////////////////////////////////////////
//		 for(int i=0; i<empCode.length;i++) {
//			System.out.println("empCode : "+empCode[i]); 
//		 }
		 
		 //approval_line테이블에 값 넣기
		 List<Map<String, Object>> ALar = draftService.setApprovalLine(empCode, empMap);
		 
		 APListVO apListVO = new APListVO();
		 Long approval_line_code = Long.parseLong(ALar.get(0).get("APPROVAL_LINE_CODE").toString());
		 apListVO.setApproval_line_code(approval_line_code);
		 
		 String employee_num = ALar.get(0).get("EMPLOYEE_NUM").toString();
		apListVO.setEmployee_num(employee_num);
		apListVO.setLine_name(lineName);
		
		List<APListVO> apar = draftService.setAPList(apListVO);
		model.addAttribute("allist", apar);
		
		 return "ajax/allist";
		
	}
	
	//즐겨찾기 이름 누를때마다 값 적용해주는 메서드
	@PostMapping("getaldetail")
	@ResponseBody
	public List<ApprovalLineVO> getALDetail(ApprovalLineVO approvalLineVO)throws Exception{		
		List<ApprovalLineVO> ar  = draftService.getALDetail(approvalLineVO);
		
		return ar;
	
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
