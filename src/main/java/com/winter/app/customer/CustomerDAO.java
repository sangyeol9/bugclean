package com.winter.app.customer;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.winter.app.employee.EmployeeVO;
import com.winter.app.util.pagination.Pagination;

@Mapper
public interface CustomerDAO {

	List<CustomerVO> getCompanyList(Pagination pagination) throws Exception;
	List<CustomerVO> getPersonList(Pagination pagination) throws Exception;
	
	Long getCompanyTotalCount(Pagination pagination) throws Exception;
	Long getPersonTotalCount(Pagination pagination) throws Exception;
	
	EmployeeVO getEmployeeName(CustomerVO customerVO) throws Exception;
	
	
	CustomerVO getDetail(CustomerVO customerVO) throws Exception;
	
	int createCustomer(CustomerVO customerVO) throws Exception;
	
	int updateCustomer(CustomerVO customerVO) throws Exception;
	
	int deleteCustomer(CustomerVO customerVO) throws Exception;
	
}
