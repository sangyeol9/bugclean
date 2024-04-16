package com.winter.app.sitesch;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.winter.app.customer.CustomerVO;
import com.winter.app.employee.EmployeeVO;

@Mapper
public interface SiteSchDAO {

	
	List<SiteSchVO> getList() throws Exception;
	
	int createSch(SiteSchVO schVO) throws Exception;
	
	//회사명으로 회사 pk와 사장 이름 가져오기
	CustomerVO getCustomerInfo(SiteSchVO schVO) throws Exception;
	
	//회사 pk로 회사명과 사장 이름 가져오기
	CustomerVO getCustomerInfo2(SiteSchVO schVO) throws Exception;
	
	List<EmployeeVO> getSales() throws Exception;
	
	List<EmployeeVO> getSiter() throws Exception;
	
	
	
	SiteSchVO getSchedule(SiteSchVO schVO) throws Exception;
	
	
}
