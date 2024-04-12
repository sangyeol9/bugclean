package com.winter.app.draft;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.winter.app.employee.DepartmentVO;



@Mapper
public interface DraftDAO {
	
	List<Map<String, Object>> getBasisDraft() throws Exception;
	List<DepartmentVO> getDepartmentList()throws Exception;
}
