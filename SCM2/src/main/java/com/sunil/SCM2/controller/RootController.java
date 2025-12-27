package com.sunil.SCM2.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.sunil.SCM2.entity.User;
import com.sunil.SCM2.helpers.Helper;
import com.sunil.SCM2.services.UserService;

@ControllerAdvice
public class RootController {
	
	@Autowired
	private UserService userService;

	@ModelAttribute
	public void addUserDetails(Authentication authentication, Model model) {
		
		if(authentication == null) return;
		
		String username = Helper.findUserNameByAuthentication(authentication);
		
		User user = userService.getUserByEmailID(username);
		
		model.addAttribute("user", user);
		
		
	}
}
