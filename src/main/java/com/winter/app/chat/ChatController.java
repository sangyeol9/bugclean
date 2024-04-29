	package com.winter.app.chat;

import java.util.List;
import java.util.Map;

import org.apache.catalina.startup.ClassLoaderFactory.Repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
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
	public String create(@RequestBody String roomId, RedirectAttributes rttr) {
		log.info("# create chat room , name : " + roomId);
		String name = "채팅방";

		rttr.addFlashAttribute("roomName", repository.createChatRoom(name,roomId));
		return "chat/room";
	}
	
	@PostMapping("inRoom")
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
	
	// 지메일로 사원 정보 받기 
	@PostMapping("getEmpName")
	@ResponseBody
	public EmployeeVO getEmployeeNum(@RequestBody EmployeeVO employeeVO) throws Exception{
		employeeVO = chatService.getEmpName(employeeVO);

		return employeeVO;
	}
	
	@GetMapping("getPrincipal")
	@ResponseBody
	public String getPrincipal() throws Exception{
		String name ="";
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails)principal;
		name = userDetails.getUsername();
		System.out.println("get principal : " + name);
		return name;
	}
	
}
