package com.winter.app.sitesch;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.winter.app.customer.CustomerVO;
import com.winter.app.employee.EmployeeVO;

@Service
public class SiteSchService {
	@Autowired
	private SiteSchDAO schDAO;
	
	public List<SiteSchVO> getList() throws Exception{
		return schDAO.getList();
	}
	public int createSch(SiteSchVO schVO) throws Exception{
		CustomerVO customerVO = new CustomerVO();
		customerVO  =schDAO.getCustomerInfo(schVO);
		schVO.setCeo_Name(customerVO.getCeo_Name());
		schVO.setCustomer_Num(customerVO.getCustomer_Num());
		
		System.out.println("sch service ===== " + schVO);
		
		return schDAO.createSch(schVO);
	}
	
	public List<EmployeeVO> getSales() throws Exception{
		
		return schDAO.getSales();
	}
	
	public List<EmployeeVO> getSiter() throws Exception{
		
		return schDAO.getSiter();
	}
	
	public SiteSchVO getSchedule(SiteSchVO schVO) throws Exception{
		SiteSchVO siteSchVO = schDAO.getSchedule(schVO);	
		CustomerVO customerVO = schDAO.getCustomerInfo2(siteSchVO);
		System.out.println("============================================");
		System.out.println("customerVO === " + customerVO);
		System.out.println("sitevo === " + siteSchVO);
		
		siteSchVO.setCeo_Name(customerVO.getCeo_Name());
		siteSchVO.setBusiness_Name(customerVO.getBusiness_Name());
		
		
		return siteSchVO;
	}
	
}
