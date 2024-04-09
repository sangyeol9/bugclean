package com.winter.app.humanResource;

import com.winter.app.employee.EmployeeVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;
import java.util.Objects;

@Mapper
public interface HumanResourceDAO {

    public List<TempMemberVO> getAskList()throws Exception;
    public List<Map<String, Object>> getMemberList()throws Exception;
    public List<Map<String, Object>> getVacationList(Integer year)throws Exception;
    public List<String> getVacYear()throws Exception;
    public List<Map<String, Object>> getResignationList()throws Exception;

}
