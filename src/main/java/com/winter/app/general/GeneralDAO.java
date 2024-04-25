package com.winter.app.general;

import org.apache.ibatis.annotations.Mapper;


import com.winter.app.general.CarManageVO;

import java.util.List;
import java.util.Map;

@Mapper
public interface GeneralDAO {

    public List<Map<String, Object>> getManageList() throws Exception;
    public int updateCarManage(CarManageVO carManageVO) throws Exception;

    public int deleteCarManage(CarManageVO carManageVO) throws Exception;

    Map<String,Object> getAllocationState(CarManageVO carManageVO) throws Exception;
    
    List<CarDetailVO> getUsableList(CarManageVO carManageVO) throws Exception;


    int carAllocation(CarManageVO carManageVO) throws Exception;

    int updateStatus(CarDetailVO carDetailVO) throws Exception;

    CarManageVO getInfo(CarManageVO carManageVO) throws Exception;

    CarDetailVO getCarNumber(CarDetailVO carDetailVO) throws Exception;
}
