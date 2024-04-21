package com.winter.app.draft;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.winter.app.employee.DepartmentVO;
import com.winter.app.employee.EmployeeVO;

@Service
public class DraftService {
	@Autowired
	private DraftDAO draftDAO;

	public List<Map<String, Object>> getBasisDraft()throws Exception{
		return draftDAO.getBasisDraft();
	}
	public List<DepartmentVO> getDepartmentHighList()throws Exception{
		return draftDAO.getDepartmentHighList();
	}
	

	public List<Map<String, Object>> setApprovalLine(String [] orgCode, Map<String, Object> empMap )throws Exception{

		ApprovalLineVO approvalLineVO = new ApprovalLineVO();
		approvalLineVO = draftDAO.getApprovalMaxNum();
			//결재선의 리스트를 가져와서 approval_code의 값이 max인걸 가져옴
		
		//결재선테이블에 기안자를 먼저 0번으로 넣어주고 나서 시작
		if(approvalLineVO == null) {
			ApprovalLineVO approvalLineVO2 = new ApprovalLineVO();
			approvalLineVO2.setApproval_line_code(1L);
			approvalLineVO2.setEmployee_num((String)empMap.get("EMPLOYEE_NUM"));
			approvalLineVO2.setLine_rank(0L);

			draftDAO.setApprovalLine(approvalLineVO2);
			for(int i=0; i<orgCode.length;i++) {
				approvalLineVO2.setApproval_line_code(1L);
				System.out.println("value Null ===========");
				System.out.println("code : "+ orgCode[i]);
				approvalLineVO2.setEmployee_num(orgCode[i]);
				approvalLineVO2.setLine_rank(Long.valueOf(i+1));
				draftDAO.setApprovalLine(approvalLineVO2);
			}

		}else {
			approvalLineVO.setApproval_line_code(approvalLineVO.getApproval_line_code()+1);
			approvalLineVO.setEmployee_num((String)empMap.get("EMPLOYEE_NUM"));
			approvalLineVO.setLine_rank(0L);

			draftDAO.setApprovalLine(approvalLineVO);
			for(int i=0; i<orgCode.length;i++) {
				approvalLineVO.setApproval_line_code(approvalLineVO.getApproval_line_code());
				System.out.println("value Not Null ===========");
				System.out.println("code : "+ orgCode[i]);
				approvalLineVO.setEmployee_num(orgCode[i]);
				approvalLineVO.setLine_rank(Long.valueOf(i+1));
				draftDAO.setApprovalLine(approvalLineVO);
			}
		}
		//결재선 목록에 저장한값을 불러오지 않았다면 결재선 CODE를 MAX값 + 로그인한 사람의 EMP_NUM을 조회해서 리스트로 뽑아옴..?
			ApprovalLineVO newApprovalLineVO = new ApprovalLineVO();
			newApprovalLineVO = draftDAO.getApprovalMaxNum();
			newApprovalLineVO.setApproval_line_code(newApprovalLineVO.getApproval_line_code());
			 newApprovalLineVO.setEmployee_num((String)empMap.get("EMPLOYEE_NUM"));
			List<Map<String, Object>> ar = draftDAO.getApprovalList(newApprovalLineVO);
			System.out.println("arList : "+ar.toString());
			return ar;
		}
	
	public DraftVO getDraftDocNum() throws Exception{
		//localdate.now().split("-")+문서종류+기안서의 리스트의 DOC_NUM의 max값을 가져와 subString해서 시퀀스 번호에 해당하는부분 번호에+1?????????????
		 LocalDate localDate = LocalDate.now();
		 String [] localDateYear = localDate.toString().split("-");
		 System.out.println("localDate : "+localDate);
		 Long parsingDm=0L;
		 	DraftVO draftVO = draftDAO.getDraftMaxDocNum();
		 	System.out.println("DraftVO.getDoc_Num"+draftVO.getDraft_num());
		 	if(draftVO.getDraft_num().equals(null)) {
		 		draftVO.setDraft_num("0");
		 		 String Doc_num = draftVO.getDraft_num();
		 		Long.parseLong(Doc_num);
		 	}else {
		 	String Doc_num = draftVO.getDraft_num();
		 	parsingDm = Long.parseLong(Doc_num.substring(7));	
			}
		 
		 System.out.println("localDateYear : "+ localDateYear[0]+"BS"+(parsingDm+1));
		draftVO.setDraft_num(localDateYear[0]+"BS"+(parsingDm+1));
		draftVO.setDraft_date(Date.valueOf(localDate.now()));
		return draftVO;
	}
	
	
	public List<DepartmentVO> getDepartmentList()throws Exception{
		return draftDAO.getDepartmentList();
	}
	
	public Map<String, Object> getEmployeeDetail(EmployeeVO employeeVO)throws Exception{
		return draftDAO.getEmployeeDetail(employeeVO);
	}
	
	public EmployeeVO getCEO()throws Exception{
		return draftDAO.getCEO();
	}
	
}
