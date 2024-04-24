package com.winter.app.general;

import com.winter.app.carManage.CarManageVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

}
