package com.winter.app.humanResource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HumanResourceService {

    @Autowired
    private HumanResourceDAO humanResourceDAO;

    public List<TempMemberVO> getAskList()throws Exception{
        return humanResourceDAO.getAskList();
    }

}
