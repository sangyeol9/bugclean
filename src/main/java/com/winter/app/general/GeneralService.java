package com.winter.app.general;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.winter.app.general.CarDetailVO;
import com.winter.app.general.CarManageVO;

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

    public int updateCarManage(CarManageVO carManageVO) throws Exception {
        return generalDAO.updateCarManage(carManageVO);
    }

    public int deleteCarManage(CarManageVO carManageVO) throws Exception {
        CarDetailVO carDetailVO = new CarDetailVO();
        carDetailVO.setCar_code(carManageVO.getCar_code());
        carDetailVO.setPro_status(0L);
        int result = generalDAO.updateStatus(carDetailVO);
        if (result == 0) {
            result = generalDAO.deleteCarManage(carManageVO);
        }else {
            return result;
        }
        return result;
    }

    public List<ProCategoryVO> getCate() throws Exception{
        return generalDAO.getCate();
    }

    public CarManageVO carAllocation(CarManageVO carManageVO) throws Exception {

        //배차 요청 정보 등록
        int result = generalDAO.carAllocation(carManageVO);
        if (result == 1) {
            CarDetailVO carDetailVO = new CarDetailVO();
            // 해당 차량 사용 가능 상태에서 배차요청 상태로 변경
            carDetailVO.setCar_code(carManageVO.getCar_code());
            carDetailVO.setPro_status(1L);
            // 해당 현장의 배차코드 넘버 부여
            generalDAO.updateStatus(carDetailVO);
        }
        carManageVO = generalDAO.getInfo(carManageVO);
        return carManageVO;
    }

    public List<CarDetailVO> getUsableList(CarManageVO carManageVO) throws Exception{
		return generalDAO.getUsableList(carManageVO);
	}

    public Map<String ,Object> getAllocationState(CarManageVO carManageVO) throws Exception{
    	return generalDAO.getAllocationState(carManageVO);
    }
    
    

    public CarDetailVO getCarNumber(CarDetailVO carDetailVO) throws Exception {

        return generalDAO.getCarNumber(carDetailVO);
    }

}
