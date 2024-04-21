package com.winter.app.board;

import com.winter.app.util.pagination.Pagination;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface BoardDAO {

    public List<BoardCateVO> getCateList() throws Exception;
    public List<Map<String, Object>> getBoardList(Pagination pagination) throws Exception;

}
