package com.winter.app.humanResource;

import com.winter.app.employee.EmployeeDAO;
import com.winter.app.employee.EmployeeVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class HumanResourceService {

    @Autowired
    private HumanResourceDAO humanResourceDAO;

    public List<TempMemberVO> getAskList()throws Exception{
        return humanResourceDAO.getAskList();
    }

    public List<EmployeeVO> getMemberList()throws Exception{
        return humanResourceDAO.getMemberList();
    }

    public List<VacationVO> getVacationList()throws Exception{
        return humanResourceDAO.getVacationList();
    }

}
