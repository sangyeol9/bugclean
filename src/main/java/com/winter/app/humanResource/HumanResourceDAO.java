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
    public List<String> getDistinctValues(String param)throws Exception;
    public List<Map<String, Object>> getResignationList()throws Exception;
    public List<Map<String, Object>> getSalaryList(Integer year)throws Exception;
    public List<Map<String, Object>> getAttendanceList(Map<String, Object> date)throws Exception;
    public Long getTotalCount(Map<String,Object> data)throws Exception;

}
