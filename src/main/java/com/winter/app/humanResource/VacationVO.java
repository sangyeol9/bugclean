package com.winter.app.humanResource;

import lombok.Data;

@Data
public class VacationVO {

    private String employee_num;
    private Long vac_full;
    private Long vac_used;
    private Long vac_year;

}
