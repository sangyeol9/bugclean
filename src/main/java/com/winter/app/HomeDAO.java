package com.winter.app;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.winter.app.board.BoardVO;

@Mapper
public interface HomeDAO {

	public List<BoardVO> getList() throws Exception;

}
