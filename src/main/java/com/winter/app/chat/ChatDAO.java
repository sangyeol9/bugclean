package com.winter.app.chat;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.winter.app.employee.DepartmentVO;

@Mapper
public interface ChatDAO {

	List<Map<String, Object>> getEmployeeList() throws Exception;
	
	List<DepartmentVO> getDepartment() throws Exception;
}
