package com.winter.app.sitesch;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.winter.app.carManage.CarDetailVO;
import com.winter.app.carManage.CarManageDAO;
import com.winter.app.customer.CustomerVO;
import com.winter.app.employee.EmployeeVO;
import com.winter.app.util.pagination.Pagination;

@Service
public class SiteSchService {
	@Autowired
	private SiteSchDAO schDAO;
	@Autowired
	private CarManageDAO carManageDAO;
	
	public List<SiteSchVO> getList(Pagination pagination) throws Exception{
		return schDAO.getList(pagination);
	}
	public int createSch(SiteSchVO schVO) throws Exception{
		CustomerVO customerVO = new CustomerVO();
		customerVO  =schDAO.getCustomerInfo2(schVO);
		schVO.setCeo_Name(customerVO.getCeo_Name());
		schVO.setBusiness_Name(customerVO.getBusiness_Name());
		
		System.out.println("sch service ===== " + schVO);
		
		return schDAO.createSch(schVO);
	}
	
	public int updateSch(SiteSchVO schVO) throws Exception{
		
		return schDAO.updateSch(schVO);
	}
	public int updateSchType(SiteSchVO schVO) throws Exception{
		return schDAO.updateSchType(schVO);
	}
	
	public List<EmployeeVO> getSales() throws Exception{
		
		return schDAO.getSales();
	}
	
	public List<EmployeeVO> getSiter() throws Exception{
		
		return schDAO.getSiter();
	}
	public List<CustomerVO> getCustomerList() throws Exception{
		
		return schDAO.getCustomerList();
	}
	public List<CarDetailVO> getUsableList() throws Exception{
		return carManageDAO.getUsableList();
		
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
	
	public int updateSchDrag(SiteSchVO schVO) throws Exception{
		return schDAO.updateSchDrag(schVO);
		
	}
	
	
	public int updateManageCode(SiteSchVO schVO) throws Exception{
		return schDAO.updateManageCode(schVO);
	}
	
}
