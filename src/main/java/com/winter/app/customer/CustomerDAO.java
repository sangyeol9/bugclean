package com.winter.app.customer;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CustomerDAO {

	List<CustomerVO> getList() throws Exception;
	
	
}
