package com.winter.app.draft;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.winter.app.employee.DepartmentVO;

@Service
public class DraftService {
	@Autowired
	private DraftDAO draftDAO;

	public List<Map<String, Object>> getBasisDraft()throws Exception{
		//localdate.split(".")+bas+총등록된끝에 시퀀스번호의 리스트를 뽑아서 제일 마지막 번호에+1?????????????
		
		return draftDAO.getBasisDraft();
	}
	
	public List<DepartmentVO> getDepartmentList()throws Exception{
		return draftDAO.getDepartmentList();
	}
	
}
