package com.winter.app.draft;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.winter.app.employee.DepartmentVO;
import com.winter.app.employee.EmployeeVO;
import com.winter.app.util.pagination.Pagination;



@Mapper
public interface DraftDAO {
	
	List<Map<String, Object>> getBasisDraft() throws Exception;
	List<DepartmentVO> getDepartmentList()throws Exception;
	DraftVO getDraftMaxDocNum()throws Exception;
	Map<String, Object> getEmployeeDetail(EmployeeVO employeeVO) throws Exception;
	List<DepartmentVO> getDepartmentHighList() throws Exception;
	int setApprovalLine(ApprovalLineVO approvalLineVO)throws Exception;
	EmployeeVO getCEO()throws Exception;
	ApprovalLineVO getApprovalMaxNum() throws Exception;
	List<Map<String, Object>> getApprovalList(ApprovalLineVO approvalLineVO) throws Exception;
	int setAPList(APListVO apListVO)throws Exception;
	List<APListVO> getAPList(APListVO apListVO)throws Exception;
	List<ApprovalLineVO> getALDetail(ApprovalLineVO approvalLineVO)throws Exception;
	int setBasisDraft(DraftVO draftVO)throws Exception;
	int setSignCheck(SignCheckVO signCheckVO)throws Exception;
	int setRef(ReferencesVO referencesVO)throws Exception;
	////////////

	int setDraftFile(DraftFileVO draftFileVO)throws Exception;
	
	///기안서디테일
	Map<String, Object> getDraftDetail(DraftVO draftVO)throws Exception;
	List<Map<String, Object>> getSignCheckDetail(DraftVO draftVO)throws Exception;
	List<Map<String, Object>> getRefDetail(DraftVO draftVO)throws Exception;
	List<DraftFileVO> getDraftFileDetail(DraftVO draftVO)throws Exception;
	
	//기안서 삭제
	int draftDelete(DraftVO draftVO)throws Exception;
	
	//각 기안서 꺼내기
	//전체
	List<Map<String, Object>> getMyDraftList(Map<String, Object> map)throws Exception;
	Long getTotalCount(EmployeeVO employeeVO)throws Exception;
	//반려
	List<Map<String, Object>> getMyReJectionList(Map<String, Object> map)throws Exception;
	Long getRejectionTotalCount(EmployeeVO employeeVO)throws Exception;
	//결재중
	List<Map<String, Object>> getMyApprovaingList(Map<String, Object> map)throws Exception;
	Long getApprovingTotalCount(EmployeeVO employeeVO)throws Exception;
	//결재완
	List<Map<String, Object>> getMyApprovedList(Map<String, Object> map)throws Exception;
	Long getApprovedTotalCount(EmployeeVO employeeVO)throws Exception;
	//임시저장
	List<Map<String, Object>> getMyTemporaryList(Map<String, Object> map)throws Exception;
	Long getTemporaryTotalCount(EmployeeVO employeeVO)throws Exception;
}
