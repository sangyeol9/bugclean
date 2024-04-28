	package com.winter.app.chat;

import java.util.List;
import java.util.Map;

import org.apache.catalina.startup.ClassLoaderFactory.Repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.winter.app.customer.CustomerController;
import com.winter.app.employee.DepartmentVO;
import com.winter.app.employee.EmployeeVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/chat")
@Slf4j
@RequiredArgsConstructor
public class ChatController {
	
	@Autowired
	ChatService chatService;
	
	private final ChatRoomRepository repository;
	
	
	@GetMapping("rooms")
	public ModelAndView rooms() {
		log.info("# all chat rooms");
		ModelAndView mv = new ModelAndView("chat/rooms");
		
		mv.addObject("list",repository.findAllRooms());
		
		return mv;
	}
	
	@PostMapping("room")
	public String create(@RequestParam String name, RedirectAttributes rttr) {
		log.info("# create chat room , name : " + name);
		rttr.addFlashAttribute("roomName", repository.createChatRoom(name));
		return "redirect:/chat/rooms";
	}
	
	@GetMapping("room")
	public void getRoom(String roomId, Model model) {
		log.info("# get chat room, roomId = ", roomId);
		
		model.addAttribute("room", repository.findRoomById(roomId));
	}
	
	
	//사원 리스트 가져오기
	@PostMapping("list")
	@ResponseBody
	public List<Map<String, Object>> getEmployeeList() throws Exception {
		
		List<Map<String, Object>> list = chatService.getEmployeeList();
		
		System.out.println(list);
		
		return list;
	}
	//부서 리스트 가져오기
	@PostMapping("department")
	@ResponseBody
	public List<DepartmentVO> getDepartment() throws Exception{
		
		List<DepartmentVO> ar = chatService.getDepartment();
		return ar;
	}
	
	// 메신저에서 사원 이름 클릭시 사원 정보 모달창
	@PostMapping("getEmpInfo")
	@ResponseBody
	public Map<String, Object> getEmpIfo(@RequestBody EmployeeVO employeeVO) throws Exception{
		System.out.println("getempInfo === \n" + employeeVO);
		Map<String, Object> map = chatService.getEmpInfo(employeeVO);
		System.out.println("after get Info === \n" + employeeVO);
		return map;
	}
	
	@PostMapping("getEmpName")
	@ResponseBody
	public EmployeeVO getEmployeeNum(@RequestBody EmployeeVO employeeVO) throws Exception{
		System.out.println("employee vo username ===== \n" + employeeVO);
		employeeVO = chatService.getEmpName(employeeVO);
		System.out.println("employee vo username ===== \n" + employeeVO);
		
		
		return employeeVO;
		
	}
	
}
