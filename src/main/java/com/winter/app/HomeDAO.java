package com.winter.app;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.winter.app.board.BoardVO;
import com.winter.app.humanResource.AttendanceVO;

@Mapper
public interface HomeDAO {

	public List<BoardVO> getList() throws Exception;

	public void setAttendDate() throws Exception;

	public int setAttendence(AttendanceVO attendanceVO) throws Exception;

	public int setWorkOut(AttendanceVO attendanceVO) throws Exception;

	public AttendanceVO getAttendTime(AttendanceVO attendanceVO) throws Exception;

	public boolean isAttended(AttendanceVO attendanceVO);

	public boolean isWorkOut(AttendanceVO attendanceVO);

}
