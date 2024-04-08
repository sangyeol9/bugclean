package com.winter.app.humanResource;

import com.winter.app.employee.EmployeeVO;
import com.winter.app.util.commons.CommonsService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
    public String vacationList()throws Exception{
        return "./HR/VacationList";
    }

    @GetMapping("temp/ask")
    @ResponseBody
    public List<Object> getAskList() throws Exception {
        List<Object> responseData = new ArrayList<>();

        Map<String, List<String>> commons = commonsService.getCommonsList();
        List<TempMemberVO> tempMemberVOS = humanResourceService.getAskList();

        Map<String, List<TempMemberVO>> tempMember = new HashMap<>();
        tempMember.put("tempMember", tempMemberVOS);

        log.info("{}", tempMember);
        log.info("{}", commons);

        responseData.add(tempMember);
        responseData.add(commons);

        return responseData;
    }

    @GetMapping("member/list")
    @ResponseBody
    public List<Map<String,Object>> getMemberList()throws Exception{
        List<Map<String,Object>> responseData = humanResourceService.getMemberList();
        log.info("{}",responseData);
        return responseData;
    }

//    @GetMapping("vacation")
//    @ResponseBody
//    public List


}
