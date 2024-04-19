package com.winter.app.carManage;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CarManageDAO {
	
	List<CarDetailVO> getUsableList() throws Exception;
	
	int carAllocation(CarManageVO carManageVO) throws Exception;
	
}
