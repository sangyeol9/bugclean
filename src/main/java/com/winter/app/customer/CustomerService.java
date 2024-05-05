package com.winter.app.customer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.winter.app.employee.EmployeeVO;
import com.winter.app.sitesch.SiteSchDAO;
import com.winter.app.util.pagination.Pagination;

@Service
public class CustomerService {

	@Autowired
	CustomerDAO customerDAO;
	@Autowired
	SiteSchDAO schDAO;
	
	public List<EmployeeVO> getSales() throws Exception{
		
		return schDAO.getSales();
	}
	
	public Map<String, Object> getCompanyList(Pagination pagination) throws Exception{
		
		
		Long totalCount = customerDAO.getCompanyTotalCount(pagination);
		System.out.println("total count ==> " + totalCount);
		pagination.setPerPage(5L);
		pagination.makeNum(totalCount);
		pagination.makeRow();
		System.out.println("pageer ==> " + pagination);
		List<CustomerVO> ar = customerDAO.getCompanyList(pagination);
		
		for(int i=0;i<ar.size();i++) {
			EmployeeVO employeeVO = new EmployeeVO();
			employeeVO = customerDAO.getEmployeeName(ar.get(i));
			ar.get(i).setEmployee_Name(employeeVO.getName());
			
		}
		Map<String, Object> companyMap = new HashMap<>();
		companyMap.put("ar", ar);
		companyMap.put("company_pager", pagination);
		System.out.println("service map ==> " + companyMap);
		return companyMap;
	}
	
	public Map<String, Object> getPersonList(Pagination pagination) throws Exception{
		Long totalCount = customerDAO.getPersonTotalCount(pagination);
		System.out.println("service personCount == > " + totalCount);
		pagination.setPerPage(5L);
		pagination.makeNum(totalCount);
		pagination.makeRow();
		
		List<CustomerVO> ar = customerDAO.getPersonList(pagination);
		
		for(int i=0;i<ar.size();i++) {
			
			EmployeeVO employeeVO = new EmployeeVO();
			employeeVO = customerDAO.getEmployeeName(ar.get(i));
			ar.get(i).setEmployee_Name(employeeVO.getName());
			
		}
		Map<String, Object> personMap = new HashMap<>();
		personMap.put("ar", ar);
		personMap.put("person_pager", pagination);
		System.out.println("service map ==> " + personMap);
		
		
		return personMap;
	}
	
	public CustomerVO getDetail(CustomerVO customerVO) throws Exception{
		customerVO = customerDAO.getDetail(customerVO);
		EmployeeVO employeeVO = customerDAO.getEmployeeName(customerVO);
		customerVO.setEmployee_Name(employeeVO.getName());
		
		return customerVO;
	}
	
	public int createCustomer(CustomerVO customerVO) throws Exception{
		System.out.println("customer service before ==> " + customerVO);
		if(customerVO.getCustomer_Type().equals("개인")) { 
			customerVO.setBusiness_Name("개인");
			
		}
		System.out.println("customer service after ==> " + customerVO);
		
		return customerDAO.createCustomer(customerVO);
	}

	public int updateCustomer( CustomerVO customerVO) throws Exception{
		return customerDAO.updateCustomer(customerVO);
	}
	
	public int deleteCustomer(CustomerVO customerVO) throws Exception{
		return customerDAO.deleteCustomer(customerVO);
	}
	
}
