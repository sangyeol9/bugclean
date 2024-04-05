package com.winter.app.util.commons;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;
import java.util.Objects;

@Mapper
public interface CommonsDAO {

    public List<String> getPositionList()throws Exception;
    public List<String> getRnRList()throws Exception;
    public List<String> getDepList()throws Exception;

}
