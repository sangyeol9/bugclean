package com.winter.app.board;

import lombok.Data;

@Data
public class BoardFileVO {

    private Long file_code;
    private Long board_code;
    private Long cate_code;
    private String file_name;
    private String origin_name;

}
