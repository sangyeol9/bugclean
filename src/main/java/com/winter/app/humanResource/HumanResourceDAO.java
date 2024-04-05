package com.winter.app.humanResource;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface HumanResourceDAO {

    public List<TempMemberVO> getAskList()throws Exception;

}
