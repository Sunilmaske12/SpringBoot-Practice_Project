package com.sunil.SCM2.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.sunil.SCM2.DTO.UserForm;
import com.sunil.SCM2.entity.User;
import com.sunil.SCM2.services.UserService;

@Controller
public class ProcessingController {
	
	@Autowired
	private UserService userService;
	
	@PostMapping("/do-register") 
	public String doRegister(@ModelAttribute UserForm userForm) {
		
		User user = User.builder()
				.name(userForm.getName())
				.email(userForm.getEmail())
				.password(userForm.getPassword())
				.about(userForm.getAddress())
				.build();
		
		userService.saveUser(user);
				
		return "redirect:/view/registerPage";
	}

}
