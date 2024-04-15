package com.winter.app.sitesch;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SiteSchDAO {

	
	List<SiteSchVO> getList() throws Exception;
	
}
