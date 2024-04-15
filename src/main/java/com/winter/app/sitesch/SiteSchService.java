package com.winter.app.sitesch;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SiteSchService {
	@Autowired
	private SiteSchDAO schDAO;
	
	public List<SiteSchVO> getList() throws Exception{
		return schDAO.getList();
	}
	
}
