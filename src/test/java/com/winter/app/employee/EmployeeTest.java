package com.winter.app.employee;

import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class EmployeeTest {

    @Autowired
    private EmployeeDAO employeeDAO;

//    @Test
    void creat() throws Exception{

        EmployeeVO employeeVO = new EmployeeVO();

        for (int i=0;i<100;i++){
            employeeVO.setUsername("test"+i+"@gmail.com");
            employeeVO.setPassword("text"+i+i+i+i);
            employeeVO.setName("노지"+i);
            employeeVO.setPhone("010-1111-3333");
            employeeVO.setAddress("서울시 서초구 반포동 반포자이아파트");
            employeeDAO.create(employeeVO);
        }
    }

}
