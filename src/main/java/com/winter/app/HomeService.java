package com.winter.app;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.winter.app.board.BoardVO;
import com.winter.app.humanResource.AttendanceVO;

@Service
public class HomeService {
	@Autowired
	private HomeDAO homeDAO;
	
	//공지
	public List<BoardVO> getList() throws Exception{
		List<BoardVO> boardVO = homeDAO.getList();
		return boardVO;
	}
	//근태기록
	public AttendanceVO getAttendTime(AttendanceVO attendanceVO) throws Exception {
		attendanceVO = homeDAO.getAttendTime(attendanceVO);
		
		return attendanceVO;
	}
	//근태자정날짜
	public void setAttendDate() throws Exception {
		homeDAO.setAttendDate();
	}
	//출
	public int setAttendence(AttendanceVO attendanceVO) throws Exception {
		int result = homeDAO.setAttendence(attendanceVO);
		return result;
	}
	//퇴
	public int setWorkOut(AttendanceVO attendanceVO) throws Exception {
		int result = homeDAO.setWorkOut(attendanceVO);
		return result;
	}
	//출여부
	public boolean isAttended(AttendanceVO attendanceVO) {
		boolean isAttended = homeDAO.isAttended(attendanceVO);
		return isAttended;
	}
	//퇴여부
	public boolean isWorkOut(AttendanceVO attendanceVO) {
		boolean isWorkOut = homeDAO.isWorkOut(attendanceVO);
		return isWorkOut;
	}
	

	
	
}
