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
	//사번아이디 찾기
	public EmployeeVO idSearchNum(EmployeeVO employeeVO);
	//폰번호로 아이디찾기
	public EmployeeVO idSearchPhone(EmployeeVO employeeVO);
	//이미신청된 아이디 일 시
	public EmployeeVO getAlreadyCheck(EmployeeVO employeeVO);
	//받은 정보로 회원있는지 체크(email)
	public EmployeeVO getUserEmailCheck(EmployeeVO employeeVO);
	//받은 정보로 회원있는지 체크(phone)
	public EmployeeVO getUserPhoneCheck(EmployeeVO employeeVO);
	
}
