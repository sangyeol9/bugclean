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
	
	@GetMapping("mydraftlist")
	public void getMyDraftList()throws Exception{
		
	}
	@GetMapping("myrejectiondraftlist")
	public void getMyReJectionList()throws Exception {
		
	}
	@GetMapping("myapprovinglist")
	public void getMyApprovingList()throws Exception {
		
	}
	@GetMapping("myapprovedlist")
	public void getMyApprovedList()throws Exception {
		
	}
	@GetMapping("mytemporarylist")
	public void getMyTemporaryList()throws Exception {
		
	}
	
}
