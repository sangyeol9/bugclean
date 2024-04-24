package com.winter.app.board;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

import java.io.Reader;
import java.util.List;

@Data
@Slf4j
public class BoardVO {

    private Long board_code;
    private String employee_num;
    private Long cate_code;
    private String board_title;
    private String board_date;
    private String board_contents;
    private String board_hit;
    private Long board_status;

    private List<BoardFileVO> fileVOs;

}
