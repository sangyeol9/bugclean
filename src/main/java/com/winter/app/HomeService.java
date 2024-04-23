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
	//근태날짜
	public void setAttendDate() throws Exception {
		homeDAO.setAttendDate();
		
	}
	public int setAttendence(AttendanceVO attendanceVO) throws Exception {
		int result = homeDAO.setAttendence(attendanceVO);
		return result;
	}
	public int setWorkOut(AttendanceVO attendanceVO) throws Exception {
		int result = homeDAO.setWorkOut(attendanceVO);
		return result;
	}
	public AttendanceVO getAttendTime(AttendanceVO attendanceVO) throws Exception {
		attendanceVO = homeDAO.getAttendTime(attendanceVO);
		
		return attendanceVO;
	}

	
	
}
