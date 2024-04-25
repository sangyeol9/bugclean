package com.winter.app.general;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.winter.app.general.CarDetailVO;
import com.winter.app.general.CarManageVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Slf4j
@RequestMapping("/general")
public class GeneralController {

    @Autowired
    GeneralService generalService;

    @GetMapping("carManage")
    public String getRequestPage(){
        return "general/CarManageAgree";
    }

    @PostMapping("carManage")
    @ResponseBody
    public int updateCarManage(CarManageVO carManageVO) throws Exception{
        return generalService.updateCarManage(carManageVO);
    }

    @PostMapping("carManage/delete")
    @ResponseBody
    public int deleteCarManage(CarManageVO carManageVO) throws Exception{
        return generalService.deleteCarManage(carManageVO);
    }

    @GetMapping("carManage/list")
    @ResponseBody
    public Map<String, Object> getManageList() throws Exception{
        Map<String, Object> response = new HashMap<>();
        response.put("data",generalService.getManageList());
        return response;
    }

    @PostMapping("carAllocation")
    @ResponseBody
    public CarManageVO carAllocation (@RequestBody CarManageVO carManageVO) throws Exception{
        carManageVO = generalService.carAllocation(carManageVO);


        return carManageVO;
    }
    
    @PostMapping("getUsableList")
	@ResponseBody
	public List<CarDetailVO> getUsableList(@RequestBody CarManageVO carManageVO) throws Exception{
		System.out.println(carManageVO);
		return generalService.getUsableList(carManageVO);
		
	}

    @PostMapping("getCarNumber")
    @ResponseBody
    public CarDetailVO postMethodName(@RequestBody CarDetailVO carDetailVO) throws Exception {

        carDetailVO = generalService.getCarNumber(carDetailVO);

        return carDetailVO;
    }



}
