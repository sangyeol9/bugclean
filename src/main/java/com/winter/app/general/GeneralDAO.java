package com.winter.app.general;

import org.apache.ibatis.annotations.Mapper;


import com.winter.app.general.CarManageVO;
import org.springframework.security.core.parameters.P;

import java.util.List;
import java.util.Map;

@Mapper
public interface GeneralDAO {


    public int cateAdd(ProCategoryVO proCategoryVO)throws Exception;
    public int updateCar(CarDetailVO carDetailVO) throws Exception;
    public int updatePro(PropertyVO propertyVO)throws Exception;
    public int deleteCar(CarDetailVO carDetailVO)throws Exception;
    public int deletePro(PropertyVO propertyVO)throws Exception;
    public List<Map<String, Object>> getManageList() throws Exception;
    public int updateCarManage(CarManageVO carManageVO) throws Exception;

    public int deleteCarManage(CarManageVO carManageVO) throws Exception;

    public List<Object> getPropertyList(PropertyVO propertyVO) throws Exception;

    public List<Object> getCarList(PropertyVO propertyVO) throws Exception;

    public List<Object> getCarType() throws Exception;

    public List<ProCategoryVO> getCate() throws Exception;

    Map<String,Object> getAllocationState(CarManageVO carManageVO) throws Exception;
    
    List<CarDetailVO> getUsableList(CarManageVO carManageVO) throws Exception;


    int carAllocation(CarManageVO carManageVO) throws Exception;

    int updateStatus(CarDetailVO carDetailVO) throws Exception;

    CarManageVO getInfo(CarManageVO carManageVO) throws Exception;

    CarDetailVO getCarNumber(CarDetailVO carDetailVO) throws Exception;

}
