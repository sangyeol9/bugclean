package com.winter.app.humanResource;

import com.winter.app.employee.EmployeeDAO;
import com.winter.app.employee.EmployeeVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Objects;

@Service
@Slf4j
public class HumanResourceService {

    @Autowired
    private HumanResourceDAO humanResourceDAO;

    public List<TempMemberVO> getAskList()throws Exception{
        return humanResourceDAO.getAskList();
    }

    public List<Map<String, Object>> getMemberList()throws Exception{
        List<Map<String, Object>> memberList = humanResourceDAO.getMemberList();
        for(int i=0;i<memberList.size();i++){
            String joinDate = memberList.get(i).get("JOIN_DATE").toString();
            int index = joinDate.indexOf(" ");
            if (index != -1) {
                joinDate = joinDate.substring(0, index);
            }
            memberList.get(i).put("JOIN_DATE", joinDate);
        }
        return memberList;
    }

    public List<VacationVO> getVacationList()throws Exception{
        return humanResourceDAO.getVacationList();
    }

}
