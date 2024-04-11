package com.winter.app.humanResource;

import com.winter.app.employee.EmployeeDAO;
import com.winter.app.employee.EmployeeVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.*;

@Service
@Slf4j
public class HumanResourceService {

    @Autowired
    private HumanResourceDAO humanResourceDAO;

    public List<TempMemberVO> getAskList() throws Exception {
        return humanResourceDAO.getAskList();
    }

    public List<Map<String, Object>> getMemberList() throws Exception {
        List<Map<String, Object>> memberList = humanResourceDAO.getMemberList();
        return setDate(memberList, "JOIN_DATE");
    }

    public Map<String, List<Map<String, Object>>> getResignationList() throws Exception {
        Map<String, List<Map<String, Object>>> responseData = new HashMap<>();
        List<Map<String, Object>> resignationList = humanResourceDAO.getResignationList();

        resignationList = setDate(resignationList, "RETIRED_DATE");
        resignationList = setDate(resignationList, "JOIN_DATE");

        LocalDate currentDate = LocalDate.now();

        List<Map<String, Object>> possible = new ArrayList<>();
        List<Map<String, Object>> impossible = new ArrayList<>();

        for (Map<String, Object> stringObjectMap : resignationList) {
            LocalDate resignedDate = LocalDate.parse((String) stringObjectMap.get("RETIRED_DATE"), DateTimeFormatter.ISO_DATE);
            long daysDifference = ChronoUnit.DAYS.between(resignedDate, currentDate);
            if (daysDifference >= 30) {
                impossible.add(stringObjectMap);
            } else {
                possible.add(stringObjectMap);
            }
        }
        responseData.put("possible", possible);
        responseData.put("impossible", impossible);
        return responseData;
    }

    private List<Map<String, Object>> setDate(List<Map<String, Object>> list, String col) {
        for (Map<String, Object> stringObjectMap : list) {
            String date = stringObjectMap.get(col).toString();
            int index = date.indexOf(" ");
            if (index != -1) {
                date = date.substring(0, index);
            }
            stringObjectMap.put(col, date);
        }
        return list;
    }

    public List<Map<String, Object>> getVacationList(Integer year) throws Exception {
        return humanResourceDAO.getVacationList(year);
    }

    public List<String> getDistinctValues(String tableName) throws Exception {
        return humanResourceDAO.getDistinctValues(tableName);
    }

    public List<Map<String, Object>> getSalaryList(Integer year)throws Exception{
        List<Map<String, Object>> ar = humanResourceDAO.getSalaryList(year);
        log.info("{}",ar);
        return humanResourceDAO.getSalaryList(year);
    }

}
