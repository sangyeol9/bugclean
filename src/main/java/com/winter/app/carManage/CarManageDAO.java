package com.winter.app.carManage;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.winter.app.sitesch.SiteSchVO;

@Mapper
public interface CarManageDAO {
	
	List<CarDetailVO> getUsableList(CarManageVO carManageVO) throws Exception;
	
	int carAllocation(CarManageVO carManageVO) throws Exception;
	
	int updateStatus1(CarDetailVO carDetailVO) throws Exception;
	
	CarManageVO getInfo(CarManageVO carManageVO) throws Exception;  
	
	CarDetailVO getCarNumber(CarDetailVO carDetailVO) throws Exception;
}
