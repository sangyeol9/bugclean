package com.winter.app.carManage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CarManageService {
	@Autowired
	private CarManageDAO carManageDAO;
	
	public List<CarDetailVO> getUsableList() throws Exception{
		return carManageDAO.getUsableList();
	}
	
	public int carAllocation(CarManageVO carManageVO) throws Exception{
		int result = carManageDAO.carAllocation(carManageVO);
	System.out.println("==========\n" + carManageVO);
		return  result;
	}
	
}
