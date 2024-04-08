package com.winter.app.draft;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/draft/*")
public class DraftController {
	
	
	@GetMapping("basisdraft")
	public void getBasisDraft()throws Exception {
		
	}
	
	@GetMapping("draftlist")
	public void getDraftList()throws Exception {
		
	}
	
	@GetMapping("draftlinemodal")
	public void getDraftLineModal()throws Exception {
		
	}
	
}
