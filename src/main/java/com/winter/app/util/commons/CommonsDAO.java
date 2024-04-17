package com.winter.app.util.commons;

import com.winter.app.employee.DepartmentVO;
import com.winter.app.employee.PositionVO;
import com.winter.app.employee.RnRVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;
import java.util.Objects;

@Mapper
public interface CommonsDAO {

    public List<PositionVO> getPositionList()throws Exception;
    public List<RnRVO> getRnRList()throws Exception;
    public List<DepartmentVO> getDepList()throws Exception;

}
