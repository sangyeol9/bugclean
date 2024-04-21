package com.winter.app.board;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

import java.text.DecimalFormat;

@Data
@Slf4j
public class BoardVO {

    private String board_code;
    private String employee_num;
    private Long cate_code;
    private String board_title;
    private String board_date;
    private String board_content;
    private String board_hit;
    private Long board_status;

}
