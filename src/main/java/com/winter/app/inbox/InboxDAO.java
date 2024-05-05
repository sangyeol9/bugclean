package com.winter.app.inbox;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.winter.app.employee.EmployeeVO;
import com.winter.app.util.pagination.Pagination;

@Mapper
public interface InboxDAO {
	public List<Map<String, Object>> getAllList(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> getWaitList(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> getProgressList(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> getDoneList(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> getReferList(Map<String, Object> map) throws Exception;
	
	public Long getAllTotalCount(Map<String, Object> map);
	public Long getWaitTotalCount(Map<String, Object> map);
	public Long getProgressTotalCount(Map<String, Object> map);
	public Long getDoneTotalCount(Map<String, Object> map);
	public Long getReferTotalCount(Map<String, Object> map);
}
