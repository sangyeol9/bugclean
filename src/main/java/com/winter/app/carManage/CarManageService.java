package com.winter.app.carManage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CarManageService {
	@Autowired
	private CarManageDAO carManageDAO;
	
	public List<CarDetailVO> getUsableList(CarManageVO carManageVO) throws Exception{
		return carManageDAO.getUsableList(carManageVO);
	}
	
	public CarManageVO carAllocation(CarManageVO carManageVO) throws Exception{
		
		//배차 요청 정보 등록
		int result = carManageDAO.carAllocation(carManageVO);
		CarDetailVO carDetailVO = new CarDetailVO();
		// 해당 차량 사용 가능 상태에서 배차요청 상태로 변경
		carDetailVO.setCar_code(carManageVO.getCar_code());
		
		// 해당 현장의 배차코드 넘버 부여
		carManageDAO.updateStatus1(carDetailVO);
		
		carManageVO = carManageDAO.getInfo(carManageVO);
		
		System.out.println("==========\n" + carManageVO);
		return  carManageVO;
	}
	
	public CarDetailVO getCarNumber (CarDetailVO carDetailVO) throws Exception{
		
		return carManageDAO.getCarNumber(carDetailVO);
	}
	
}
