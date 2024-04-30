package com.winter.app.general;

import com.winter.app.util.commons.CarTypeEncoder;
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

    @Autowired
    CarTypeEncoder carTypeEncoder;


    public int cateAdd(ProCategoryVO proCategoryVO)throws Exception{
        return generalDAO.cateAdd(proCategoryVO);
    }
    public int updateCar(CarDetailVO carDetailVO) throws Exception {
        return generalDAO.updateCar(carDetailVO);
    }

    public int updatePro(PropertyVO propertyVO) throws Exception{
        return generalDAO.updatePro(propertyVO);
    }

    public int deleteCar(CarDetailVO carDetailVO)throws Exception{
        return generalDAO.deleteCar(carDetailVO);
    }

    public int deletePro(PropertyVO propertyVO)throws Exception{
        return generalDAO.deletePro(propertyVO);
    }

    public List<Map<String, Object>> getManageList() throws Exception {
        return generalDAO.getManageList();
    }

    public int updateCarManage(CarManageVO carManageVO) throws Exception {
        return generalDAO.updateCarManage(carManageVO);
    }

    public int deleteCarManage(CarManageVO carManageVO) throws Exception {
        CarDetailVO carDetailVO = new CarDetailVO();
        carDetailVO.setCar_code(carManageVO.getCar_code());
        carDetailVO.setCar_status(0L);
        int result = generalDAO.updateStatus(carDetailVO);
        if (result == 0) {
            result = generalDAO.deleteCarManage(carManageVO);
        } else {
            return result;
        }
        return result;
    }

    public List<ProCategoryVO> getCate() throws Exception {
        return generalDAO.getCate();
    }

    public List<Object> getCarType() throws Exception {
        return generalDAO.getCarType();
    }

    public List<Object> getPropertyList(PropertyVO propertyVO) throws Exception {
        if (propertyVO.getPro_category() == 100) {
            return generalDAO.getCarList(propertyVO);
        }

        return generalDAO.getPropertyList(propertyVO);
    }

    public CarManageVO carAllocation(CarManageVO carManageVO) throws Exception {

        //배차 요청 정보 등록
        int result = generalDAO.carAllocation(carManageVO);
        if (result == 1) {
            CarDetailVO carDetailVO = new CarDetailVO();
            // 해당 차량 사용 가능 상태에서 배차요청 상태로 변경
            carDetailVO.setCar_code(carManageVO.getCar_code());
            carDetailVO.setCar_status(1L);
            // 해당 현장의 배차코드 넘버 부여
            generalDAO.updateStatus(carDetailVO);
        }
        carManageVO = generalDAO.getInfo(carManageVO);
        return carManageVO;
    }

    public List<CarDetailVO> getUsableList(CarManageVO carManageVO) throws Exception {
        return generalDAO.getUsableList(carManageVO);
    }

    public Map<String, Object> getAllocationState(CarManageVO carManageVO) throws Exception {
        return generalDAO.getAllocationState(carManageVO);
    }


    public CarDetailVO getCarNumber(CarDetailVO carDetailVO) throws Exception {

        return generalDAO.getCarNumber(carDetailVO);
    }

}
