package com.winter.app.board;

import com.winter.app.util.pagination.Pagination;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Slf4j
public class BoardService {

    @Autowired
    BoardDAO boardDAO;

    public List<BoardCateVO> getCateList() throws Exception {
        return boardDAO.getCateList();
    }

    public List<Map<String, Object>> getBoardList(Pagination pagination) throws Exception {

        return boardDAO.getBoardList(pagination);
    }

}
