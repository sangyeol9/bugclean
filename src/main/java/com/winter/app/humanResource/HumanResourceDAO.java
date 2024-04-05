package com.winter.app.humanResource;

import com.winter.app.employee.EmployeeVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface HumanResourceDAO {

    public List<TempMemberVO> getAskList()throws Exception;
    public List<EmployeeVO> getMemberList()throws Exception;
    public List<VacationVO> getVacationList()throws Exception;
}
