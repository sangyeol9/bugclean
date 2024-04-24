package com.winter.app.general;

import com.winter.app.carManage.CarManageVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface GeneralDAO {

    public List<Map<String, Object>> getManageList() throws Exception;
    public int updateCarManage(CarManageVO carManageVO) throws Exception;

    public int deleteCarManage(CarManageVO carManageVO) throws Exception;
}
