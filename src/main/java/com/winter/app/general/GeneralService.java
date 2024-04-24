package com.winter.app.general;

import com.winter.app.carManage.CarManageVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@Slf4j
public class GeneralService {

    @Autowired
    GeneralDAO generalDAO;

    public List<Map<String, Object>> getManageList() throws Exception {
        return generalDAO.getManageList();
    }

    public int updateCarManage(CarManageVO carManageVO) throws Exception{
        return generalDAO.updateCarManage(carManageVO);
    }

    public int deleteCarManage(CarManageVO carManageVO) throws Exception{
        return generalDAO.deleteCarManage(carManageVO);
    }

}
