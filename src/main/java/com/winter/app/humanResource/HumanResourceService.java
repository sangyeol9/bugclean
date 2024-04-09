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

        log.info("{}",resignationList);
        for (int i = 0; i < resignationList.size(); i++) {
            LocalDate resignedDate = LocalDate.parse((String)resignationList.get(i).get("RETIRED_DATE"), DateTimeFormatter.ISO_DATE);
            long daysDifference = ChronoUnit.DAYS.between(resignedDate, currentDate);
            if(daysDifference >= 30){
                impossible.add(resignationList.get(i));
            }else {
                possible.add(resignationList.get(i));
            }
        }
        responseData.put("possible", possible);
        responseData.put("impossible", impossible);
        return responseData;
    }

    private List<Map<String, Object>> setDate(List<Map<String, Object>> list, String col) {
        for (int i = 0; i < list.size(); i++) {
            String date = list.get(i).get(col).toString();
            int index = date.indexOf(" ");
            if (index != -1) {
                date = date.substring(0, index);
            }
            list.get(i).put(col, date);
        }
        return list;
    }

    public List<Map<String, Object>> getVacationList(Integer year) throws Exception {
        return humanResourceDAO.getVacationList(year);
    }

    public List<String> getVacYear() throws Exception {
        return humanResourceDAO.getVacYear();
    }

}
