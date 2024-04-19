package com.winter.app.humanResource;

import com.winter.app.employee.DepartmentVO;
import com.winter.app.employee.EmployeeVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface HumanResourceDAO {

    public List<TempEmployeeVO> getAskList() throws Exception;

    public List<Map<String, Object>> getMemberList() throws Exception;

    public List<Map<String, Object>> getVacationList(Integer year) throws Exception;

    public List<String> getDistinctValues(String param) throws Exception;

    public List<Map<String, Object>> getResignationList() throws Exception;

    public List<Map<String, Object>> getSalaryList(Integer year) throws Exception;

    public List<Map<String, Object>> getAttendanceList(Map<String, Object> date) throws Exception;

    public Long getTotalCount(Map<String, Object> data) throws Exception;

    public TempEmployeeVO getTempMember(String userName) throws Exception;

    public String getNextNum() throws Exception;

    public String getManagerNum(DepartmentVO departmentVO) throws Exception;

    public int setEmployee(EmployeeVO employeeVO) throws Exception;
    public int delTempEmployee(String userName) throws Exception;
    public int updateResignationList(EmployeeVO employeeVO) throws Exception;
    public Map<String, Object> getMemberDetail(EmployeeVO employeeVO) throws Exception;
    public int updateMember(Map<String, Object> map) throws Exception;
    public int updateFired(Map<String, Object> map) throws Exception;
}
