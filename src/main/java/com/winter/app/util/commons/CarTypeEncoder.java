package com.winter.app.util.commons;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
@Component
@Slf4j
public class CarTypeEncoder {
    public String encoderCarType(Long carType){
        log.info("{}",carType.intValue());
        return switch (carType.intValue()) {
            case 0 -> "경차";
            case 1 -> "중형승용차";
            case 2 -> "영업용 승합차";
            case 3 -> "대형승용차";
            default -> "오류";
        };
    }

}
