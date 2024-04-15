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

    @GetMapping("/temp/list")
    public String tempList() throws Exception {
    	log.info("===================");
        return "HR/MemberAgree";
    }

    @GetMapping("member")
    public String memberList() throws Exception {
        return "./HR/MemberList";
    }

    @GetMapping("salary")
    public ModelAndView salaryList(ModelAndView mv) throws Exception {
        mv.addObject("salYear", humanResourceService.getDistinctValues("SALARY"));
        mv.setViewName("./HR/MemberSalary");
        return mv;
    }

    @GetMapping("vacation")
    public ModelAndView vacationList(ModelAndView mv) throws Exception {
        mv.addObject("vacYear", humanResourceService.getDistinctValues("VACATION"));
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

        responseData.put("tempMember", tempMember.get("tempMember"));
        responseData.put("commons", commons);

        return responseData;
    }

    @GetMapping("member/list")
    @ResponseBody
    public List<Map<String, Object>> getMemberList() throws Exception {
        return humanResourceService.getMemberList();
    }

    @GetMapping("resignation/list")
    @ResponseBody
    public Map<String, List<Map<String, Object>>> getResignationList() throws Exception {
        return humanResourceService.getResignationList();
    }

    @GetMapping("vacation/list")
    @ResponseBody
    public List<Map<String, Object>> getVacationList(Integer year) throws Exception {
        return humanResourceService.getVacationList(year);
    }

    @GetMapping("salary/list")
    @ResponseBody
    public List<Map<String, Object>> getSalaryList(Integer year) throws Exception {
        return humanResourceService.getSalaryList(year);
    }

}
