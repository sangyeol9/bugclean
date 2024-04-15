package com.winter.app.draft;

import java.sql.Date;
import java.time.LocalDate;
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
		return draftDAO.getBasisDraft();
	}
	
	public DraftVO getDraftDocNum() throws Exception{
		//localdate.now().split("-")+문서종류+기안서의 리스트의 DOC_NUM의 max값을 가져와 subString해서 시퀀스 번호에 해당하는부분 번호에+1?????????????
		 LocalDate localDate = LocalDate.now();
		 String [] localDateYear = localDate.toString().split("-");
		 System.out.println("localDate : "+localDate);
		 Long parsingDm=0L;
		 	DraftVO draftVO = draftDAO.getDraftMaxDocNum();
		 	System.out.println("DraftVO.getDoc_Num"+draftVO.getDoc_num());
		 	if(draftVO.getDoc_num().equals(null)) {
		 		draftVO.setDoc_num("0");
		 		 String Doc_num = draftVO.getDoc_num();
		 		Long.parseLong(Doc_num);
		 	}else {
		 	String Doc_num = draftVO.getDoc_num();
		 	parsingDm = Long.parseLong(Doc_num.substring(7));	
			}
		 
		 System.out.println("localDateYear : "+ localDateYear[0]+"BS"+(parsingDm+1));
		draftVO.setDoc_num(localDateYear[0]+"BS"+(parsingDm+1));
		draftVO.setDraft_date(Date.valueOf(localDate.now()));
		return draftVO;
	}
	
	public List<DepartmentVO> getDepartmentList()throws Exception{
		return draftDAO.getDepartmentList();
	}
	
}
