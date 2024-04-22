package com.winter.app.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.winter.app.employee.EmployeeVO;
import com.winter.app.sitesch.SiteSchDAO;

@Service
public class CustomerService {

	@Autowired
	CustomerDAO customerDAO;
	@Autowired
	SiteSchDAO schDAO;
	
	public List<EmployeeVO> getSales() throws Exception{
		
		return schDAO.getSales();
	}
	
	public List<CustomerVO> getCompanyList() throws Exception{
		List<CustomerVO> ar = customerDAO.getCompanyList();
		for(int i=0;i<ar.size();i++) {
			
			EmployeeVO employeeVO = new EmployeeVO();
			employeeVO = customerDAO.getEmployeeName(ar.get(i));
			ar.get(i).setEmployee_Name(employeeVO.getName());
			
		}
		return ar;
	}
	public List<CustomerVO> getPersonList() throws Exception{
		List<CustomerVO> ar = customerDAO.getPersonList();
		
		for(int i=0;i<ar.size();i++) {
			
			EmployeeVO employeeVO = new EmployeeVO();
			employeeVO = customerDAO.getEmployeeName(ar.get(i));
			ar.get(i).setEmployee_Name(employeeVO.getName());
			
		}
		
		return ar;
	}
	
	public CustomerVO getDetail(CustomerVO customerVO) throws Exception{
		customerVO = customerDAO.getDetail(customerVO);
		EmployeeVO employeeVO = customerDAO.getEmployeeName(customerVO);
		customerVO.setEmployee_Name(employeeVO.getName());
		
		return customerVO;
	}
	
	public int createCustomer(CustomerVO customerVO) throws Exception{
		if(customerVO.getCustomer_Type().equals("개인")) { 
			customerVO.setBusiness_Name("개인");
			
		}
		
		
		return customerDAO.createCustomer(customerVO);
	}

	public int updateCustomer( CustomerVO customerVO) throws Exception{
		return customerDAO.updateCustomer(customerVO);
	}
	
	public int deleteCustomer(CustomerVO customerVO) throws Exception{
		return customerDAO.deleteCustomer(customerVO);
	}
	
}
