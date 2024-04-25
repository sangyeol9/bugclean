package com.winter.app.sitesch;

import java.util.List;

import com.winter.app.general.GeneralDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.winter.app.general.CarDetailVO;
import com.winter.app.general.GeneralDAO;
import com.winter.app.general.CarManageVO;
import com.winter.app.customer.CustomerVO;
import com.winter.app.employee.EmployeeVO;
import com.winter.app.util.pagination.Pagination;

@Service
public class SiteSchService {
	@Autowired
	private SiteSchDAO schDAO;
	@Autowired
	private GeneralDAO generalDAO;
	
	public List<SiteSchVO> getList(Pagination pagination) throws Exception{
		return schDAO.getList(pagination);
	}
	public int createSch(SiteSchVO schVO) throws Exception{
		
		List<EmployeeVO> employeeVO = schDAO.getEmployeeState(schVO);
		for(EmployeeVO li : employeeVO) {
			if(li.getState().equals("0")) {
				return 0;
			}				
		}
		employeeVO = schDAO.getEmployeeState2(schVO);
		for(EmployeeVO li : employeeVO) {
			if(li.getState().equals("0")) {
				return 0;
			}				
		}
		
		CustomerVO customerVO = new CustomerVO();
		customerVO  =schDAO.getCustomerInfo2(schVO);
		schVO.setCeo_Name(customerVO.getCeo_Name());
		schVO.setBusiness_Name(customerVO.getBusiness_Name());
		
		System.out.println("sch service ===== " + schVO);
		
		return schDAO.createSch(schVO);
	}
	
	public int updateSch(SiteSchVO schVO) throws Exception{
		
		List<EmployeeVO> employeeVO = schDAO.getEmployeeState(schVO);
		for(EmployeeVO li : employeeVO) {
			if(li.getState().equals("0")) {
				return 0;
			}
						
		}
		employeeVO = schDAO.getEmployeeState2(schVO);
		for(EmployeeVO li : employeeVO) {
			if(li.getState().equals("0")) {
				return 0;
			}				
		}
		
		return schDAO.updateSch(schVO);
	}
	public int updateSchType(SiteSchVO schVO) throws Exception{
		return schDAO.updateSchType(schVO);
	}
	
	public List<EmployeeVO> getSales() throws Exception{
		List<EmployeeVO> ar = schDAO.getSales() ;
		for(int i=0; i< ar.size();i++) {
			if(ar.get(i).getState().equals("0")) {
				ar.get(i).setName(ar.get(i).getName()+" (퇴사)");
			}
		}
		return  ar;
	}
	
	public List<EmployeeVO> getSiter() throws Exception{
		List<EmployeeVO> ar = schDAO.getSiter();
		for(int i=0; i< ar.size();i++) {
			if(ar.get(i).getState().equals("0")) {
				ar.get(i).setName(ar.get(i).getName()+" (퇴사)");
			}
		}
		return ar;
	}
	public List<CustomerVO> getCustomerList() throws Exception{
		
		return schDAO.getCustomerList();
	}
	public List<CarDetailVO> getUsableList() throws Exception{
		return generalDAO.getUsableList();
		
	}
	
	public SiteSchVO getSchedule(SiteSchVO schVO) throws Exception{
		SiteSchVO siteSchVO = schDAO.getSchedule(schVO);	
		CustomerVO customerVO = schDAO.getCustomerInfo2(siteSchVO);
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
