package com.winter.app;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class WebErrorController implements ErrorController{
	
	
	@GetMapping("/error")
    public String handleError(HttpServletRequest request) {
        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);

        if(status != null){
            int statusCode = Integer.valueOf(status.toString());
            
            //400, 403, 404, 500, 503
            if(statusCode == HttpStatus.BAD_REQUEST.value()) {
            	return "error/400error";
            }else if(statusCode == HttpStatus.FORBIDDEN.value()) {
                return "error/403error";
            }else if(statusCode == HttpStatus.NOT_FOUND.value()) {
                return "error/404error";
            }else if(statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
            	return "error/500error";
            }else if(statusCode == HttpStatus.SERVICE_UNAVAILABLE.value()) {
            	return "error/503error";
            }else {
                return "error/error";
            }
        
        }
        return "error/error";
        

	}
}
