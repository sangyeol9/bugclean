package com.winter.app;

import com.winter.app.board.BoardCateVO;
import com.winter.app.board.BoardService;
import com.winter.app.board.BoardVO;
import com.winter.app.employee.EmployeeVO;
import com.winter.app.humanResource.AttendanceVO;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/")
public class HomeController {
	
	@Autowired
	HomeService homeService;
    @Autowired
    BoardService boardService;

    @GetMapping("")
    public String SidebarInit(HttpSession session, Model model) throws Exception{
        //공지
    	List<BoardVO> boardVO = homeService.getList();
    	model.addAttribute("boardVO",boardVO);
    	
    	//사이드바 게시판 항목
    	List<BoardCateVO> ar = boardService.getCateList();

        List<String> codes = new ArrayList<>();
        List<String> names = new ArrayList<>();
        for(BoardCateVO cate : ar){
            codes.add(cate.getCate_code().toString());
            names.add(cate.getCate_name());
        }

        session.setAttribute("code",codes);
        session.setAttribute("name",names);
        
        
        return "index";
    }
    //@Scheduled(cron = "0 0 0 * * *")
  	public void AttendenceDate() {
  		//System.out.println("Cron");
  		//memberDAO.getDetail(null);
  	}
    //출근
    @PostMapping("Attendence")
	private String Attendence(AttendanceVO attendanceVO, Model model) throws Exception {
		int result = homeService.Attendence(attendanceVO);
    	
    	
    	return "index";
	}
    //퇴근~~
    @PostMapping("WorkOut")
	private void WorkOut() throws Exception {
		
    	
    	
    	return;
	}
    
    

    
}
