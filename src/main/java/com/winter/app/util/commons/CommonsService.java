package com.winter.app.util.commons;

import com.winter.app.employee.DepartmentVO;
import com.winter.app.employee.PositionVO;
import com.winter.app.employee.RnRVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
@Slf4j
public class CommonsService {

    @Autowired
    private CommonsDAO commonsDAO;
    public Map<String, List<Object>> getCommonsList()throws Exception{
        Map<String, List<Object>> All = new HashMap<>();
        List<Object> dep = new ArrayList<>(commonsDAO.getDepList());
        List<Object> pos = new ArrayList<>(commonsDAO.getPositionList());
        List<Object> rnr = new ArrayList<>(commonsDAO.getRnRList());

        All.put("dep", dep);
        All.put("pos", pos);
        All.put("rnr", rnr);

        return All;
    }
}
