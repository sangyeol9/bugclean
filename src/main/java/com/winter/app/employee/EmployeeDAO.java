package com.winter.app.employee;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EmployeeDAO {

	public EmployeeVO getDetail(EmployeeVO employeeVO) throws Exception;
	//가입
	public int create(EmployeeVO employeeVO) throws Exception;
	//비번 변경
	public int pwUpdate(EmployeeVO employeeVO);
	//서명 변경
	public int signSave(EmployeeVO employeeVO);
	//정보 변경
	public int infoUpdate(EmployeeVO employeeVO);
	//프로필 변경
	public int profileUpdate(EmployeeVO employeeVO);
	
}
