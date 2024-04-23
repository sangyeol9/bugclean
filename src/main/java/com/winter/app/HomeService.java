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
	
	public List<BoardVO> getList() throws Exception{
		List<BoardVO> boardVO = homeDAO.getList();
		return boardVO;
	}
	
	
	public int Attendence(AttendanceVO attendanceVO) {
		//int result = homeService.Attendence(attendanceVO);
		return 0;
	}
	
}
