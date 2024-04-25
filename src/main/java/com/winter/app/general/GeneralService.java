package com.winter.app.general;

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

    public List<CarDetailVO> getUsableList() throws Exception{
        return generalDAO.getUsableList();
    }

    public CarManageVO carAllocation(CarManageVO carManageVO) throws Exception{

        //배차 요청 정보 등록
        int result = generalDAO.carAllocation(carManageVO);
        CarDetailVO carDetailVO = new CarDetailVO();
        // 해당 차량 사용 가능 상태에서 배차요청 상태로 변경
        carDetailVO.setCar_code(carManageVO.getCar_code());

        // 해당 현장의 배차코드 넘버 부여
        generalDAO.updateStatus1(carDetailVO);

        carManageVO = generalDAO.getInfo(carManageVO);

        System.out.println("==========\n" + carManageVO);
        return  carManageVO;
    }

    public CarDetailVO getCarNumber (CarDetailVO carDetailVO) throws Exception{

        return generalDAO.getCarNumber(carDetailVO);
    }

}
