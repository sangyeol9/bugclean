package com.winter.app.board;

import com.winter.app.util.pagination.Pagination;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface BoardDAO {

    public List<BoardCateVO> getCateList() throws Exception;
    public List<Map<String, Object>> getBoardList(Pagination pagination) throws Exception;
    public Long getTotalCount(Pagination pagination) throws Exception;
    public int addBoard(BoardVO boardVO)throws Exception;
    public int addFile(BoardFileVO fileVO)throws Exception;
    public Long getSeq();
    public Map<String, Object> getBoardDetail(BoardVO boardVO)throws Exception;
    public BoardFileVO getFileDetail(BoardFileVO boardFileVO)throws Exception;
}
