
package com.sunil.SCM2.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.sunil.SCM2.DTO.Message;
import com.sunil.SCM2.DTO.UserForm;
import com.sunil.SCM2.entity.User;
import com.sunil.SCM2.enums.MessageType;
import com.sunil.SCM2.services.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ProcessingController {
	
	@Autowired
	private UserService userService;
	
	@PostMapping("/do-register") 
	public String doRegister(@ModelAttribute UserForm userForm, HttpSession session, BindingResult bindingResult) {
		
		if(bindingResult.hasErrors()) {
			return "redirect:/view/registerPage";
		}
		
		User user = User.builder()
				.name(userForm.getName())
				.email(userForm.getEmail())
				.password(userForm.getPassword())
				.about(userForm.getAbout())
				.phoneNumber(userForm.getContact())
				.build();
		
		userService.saveUser(user);
		
		Message message = Message.builder().content("Registration successful").messageType(MessageType.green).build();
		session.setAttribute("message", message);
		
		
				
		return "redirect:/view/registerPage";
	}

}
