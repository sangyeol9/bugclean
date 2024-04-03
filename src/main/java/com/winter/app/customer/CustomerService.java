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
	
}
