package com.winter.app.util.commons;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Service
@Slf4j
public class CommonsService {

    @Autowired
    private CommonsDAO commonsDAO;
    public Map<String, List<String>> getCommonsList()throws Exception{
        Map<String, List<String>> All = new HashMap<>();
        List<String> dep = commonsDAO.getDepList();
        List<String> pos = commonsDAO.getPositionList();
        List<String> rnr = commonsDAO.getRnRList();

        All.put("dep",dep);
        All.put("pos",pos);
        All.put("rnr",rnr);

        return All;
    }
}
