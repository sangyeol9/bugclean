package com.winter.app.sitesch;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.winter.app.customer.CustomerVO;
import com.winter.app.employee.EmployeeVO;
import com.winter.app.util.pagination.Pagination;

@Mapper
public interface SiteSchDAO {

	
	List<Map<String, Object>> getList(Pagination pagination) throws Exception;
	
	int createSch(SiteSchVO schVO) throws Exception;
	
	List<EmployeeVO> getEmployeeState(SiteSchVO schVO) throws Exception;
	List<EmployeeVO> getEmployeeState2(SiteSchVO schVO) throws Exception;
	
	int updateSch(SiteSchVO schVO) throws Exception;
	int updateSchType(SiteSchVO schVO) throws Exception;
	//회사명으로 회사 pk와 사장 이름 가져오기
	CustomerVO getCustomerInfo(SiteSchVO schVO) throws Exception;
	
	//회사 pk로 회사명과 사장 이름 가져오기
	CustomerVO getCustomerInfo2(SiteSchVO schVO) throws Exception;
	
	List<EmployeeVO> getSales() throws Exception;
	
	List<EmployeeVO> getSiter() throws Exception;
	
	List<CustomerVO> getCustomerList() throws Exception;
	
	SiteSchVO getSchedule(SiteSchVO schVO) throws Exception;
	
	int updateSchDrag(SiteSchVO schVO) throws Exception;
	
	int updateManageCode(SiteSchVO schVO) throws Exception;
}
