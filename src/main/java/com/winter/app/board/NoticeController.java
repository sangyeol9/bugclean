package com.winter.app.board;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
@RequestMapping("/notice")
public class NoticeController {

    @RequestMapping("list")
    public String getNoticeList() throws Exception{
        return "notice/NoticeList";
    }

}
