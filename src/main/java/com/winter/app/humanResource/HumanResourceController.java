package com.winter.app.humanResource;

import com.winter.app.employee.EmployeeVO;
import com.winter.app.util.commons.CommonsService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

@Controller
@RequestMapping("/hr")
@Slf4j
public class HumanResourceController {

    @Autowired
    private HumanResourceService humanResourceService;

    @Autowired
    private CommonsService commonsService;

    @GetMapping("temp/list")
    public String tempList() throws Exception{
        return "./HR/MemberAgree";
    }

    @GetMapping("member")
    public String memberList()throws Exception{
        return "./HR/MemberList";
    }

    @GetMapping("vacation")
    public ModelAndView vacationList(ModelAndView mv)throws Exception{
        mv.addObject("vacYear",humanResourceService.getVacYear());
        mv.setViewName("./HR/VacationList");
        return mv;
    }

    @GetMapping("temp/ask")
    @ResponseBody
    public Map<String, Object> getAskList() throws Exception {
        Map<String, Object> responseData = new HashMap<>();

        Map<String, List<String>> commons = commonsService.getCommonsList();
        List<TempMemberVO> tempMemberVOS = humanResourceService.getAskList();

        Map<String, List<TempMemberVO>> tempMember = new HashMap<>();
        tempMember.put("tempMember", tempMemberVOS);

        log.info("{}", tempMember);
        log.info("{}", commons);

        responseData.put("tempMember", tempMember.get("tempMember"));
        responseData.put("commons", commons);

        return responseData;
    }

    @GetMapping("member/list")
    @ResponseBody
    public List<Map<String,Object>> getMemberList()throws Exception{
        List<Map<String,Object>> responseData = humanResourceService.getMemberList();
        return responseData;
    }

    @GetMapping("resignation/list")
    @ResponseBody
    public Map<String, List<Map<String, Object>>> getResignationList()throws Exception{
        Map<String, List<Map<String, Object>>> responseData = humanResourceService.getResignationList();
        log.info("{}",responseData);
        return responseData;
    }

    @GetMapping("vacation/list")
    @ResponseBody
    public List<Map<String, Object>> getVacationList(Integer year) throws Exception{
        List<Map<String,Object>> responseDate = humanResourceService.getVacationList(year);
        log.info("{}",responseDate);
        return responseDate;
    }

}
