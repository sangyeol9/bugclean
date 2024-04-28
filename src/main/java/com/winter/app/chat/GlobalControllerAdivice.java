package com.winter.app.chat;

import org.apache.catalina.authenticator.SpnegoAuthenticator.AuthenticateAction;
import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@ControllerAdvice
public class GlobalControllerAdivice {

		@ModelAttribute
		public void addAuthenticationToModel(Model model, Authentication authentication) {
			model.addAttribute("authentication", authentication);
		}
	
}
