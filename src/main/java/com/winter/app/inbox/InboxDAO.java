package com.winter.app.inbox;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.winter.app.employee.EmployeeVO;

@Mapper
public interface InboxDAO {
	public List<Map<String, Object>> getAllList(EmployeeVO employeeVO) throws Exception;
	public List<Map<String, Object>> getWaitList(EmployeeVO employeeVO) throws Exception;
	public List<Map<String, Object>> getProgressList(EmployeeVO employeeVO) throws Exception;
	public List<Map<String, Object>> getDoneList(EmployeeVO employeeVO) throws Exception;
	public List<Map<String, Object>> getReferList(EmployeeVO employeeVO) throws Exception;
}
