package com.winter.app.humanResource;

import lombok.Data;

@Data
public class VacationVO {

    private String employee_num;
    private Integer vac_full;
    private Integer vac_used;
    private Integer vac_year;

}
