package com.winter.app.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustomerService {

	@Autowired
	CustomerDAO customerDAO;
	 
	public List<CustomerVO> getList() throws Exception{
		return customerDAO.getList();
	}
	
	public CustomerVO getDetail(CustomerVO customerVO) throws Exception{
		return customerDAO.getDetail(customerVO);
	}
	
	public int createCustomer(CustomerVO customerVO) throws Exception{
		return customerDAO.createCustomer(customerVO);
	}

	public int updateCustomer( CustomerVO customerVO) throws Exception{
		return customerDAO.updateCustomer(customerVO);
	}
}
