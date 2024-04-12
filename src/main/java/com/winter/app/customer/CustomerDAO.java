package com.winter.app.customer;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CustomerDAO {

	List<CustomerVO> getList() throws Exception;
	
	CustomerVO getDetail(CustomerVO customerVO) throws Exception;
	
	int createCustomer(CustomerVO customerVO) throws Exception;
	
	int updateCustomer(CustomerVO customerVO) throws Exception;
	
	int deleteCustomer(CustomerVO customerVO) throws Exception;
	
}
