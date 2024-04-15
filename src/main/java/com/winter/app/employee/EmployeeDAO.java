package com.winter.app.employee;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EmployeeDAO {

	public EmployeeVO getDetail(EmployeeVO employeeVO) throws Exception;
	//가입
	public int create(EmployeeVO employeeVO) throws Exception;
	
}
