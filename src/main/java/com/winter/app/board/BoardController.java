package com.winter.app.board;

import com.winter.app.util.pagination.Pagination;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Slf4j
@RequestMapping("/board")
public class BoardController {

    @Autowired
    BoardService boardService;

    @GetMapping("")
    public ModelAndView getBoard(BoardCateVO boardCateVO, Integer home, ModelAndView mv, HttpSession session) throws Exception {
        List<BoardCateVO> ar = boardService.getCateList();
        log.info("========home=========={}",home);
        List<String> codes = new ArrayList<>();
        List<String> names = new ArrayList<>();
        for (BoardCateVO cate : ar) {
            codes.add(cate.getCate_code().toString());
            names.add(cate.getCate_name());
        }
        if(home != null) {
        	mv.addObject("home", home);
        }
        
        session.setAttribute("code",codes);
        session.setAttribute("name",names);

        mv.addObject("active", boardCateVO.getCate_code());
        mv.setViewName("board/mainPage");

        return mv;
    }

    @GetMapping("mainPage")
    public ModelAndView viewBoard(BoardCateVO boardCateVO, ModelAndView mv) throws Exception {

        mv.addObject("active", boardCateVO.getCate_code());
        mv.setViewName("board/list");

        log.info("{}", mv);

        return mv;
    }

    @GetMapping("create")
    public ModelAndView createBoardPage(BoardVO boardVO, ModelAndView mv) throws Exception {
        if (boardVO.getBoard_code() != null) {
            mv.addObject("board", boardService.getBoardDetail(boardVO));
        }
        mv.addObject("code", boardVO.getCate_code());
        mv.setViewName("board/create");

        return mv;
    }

    @PostMapping("create")
    @ResponseBody
    public int setBoard(BoardVO boardVO, MultipartFile[] files) throws Exception {

        if (boardVO.getBoard_title().equals("")) {
            return 0;
        }

        return boardService.setBoard(boardVO, files);
    }

    @RequestMapping("download")
    public String download(BoardFileVO boardFileVO, Model model) throws Exception {
        log.info("{}", boardFileVO);
        BoardFileVO fileVO = boardService.getFileDetail(boardFileVO);
        // 다운로드할 파일 정보 설정
        model.addAttribute("fileVO", fileVO);

        return "boardFileDown";
    }


    @GetMapping("list")
    @ResponseBody
    public Map<String, Object> getBoardList(Pagination pagination) throws Exception {
        log.info("page : {}", pagination);
        return boardService.getBoardList(pagination);
    }
    
    @PostMapping("detail")
    public ModelAndView getBoardDetail(BoardVO boardVO, ModelAndView mv) throws Exception {
    Map<String, Object> response = boardService.getBoardDetail(boardVO);
        mv.setViewName("board/detail");
        log.info("노찌롱ㅁ ㅓㅇ청이{}",boardVO);
      mv.addObject("board", response);
       log.info("{}", response);

        return mv;
    }

}
