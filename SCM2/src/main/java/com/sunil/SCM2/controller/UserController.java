package com.sunil.SCM2.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sunil.SCM2.DTO.ContactForm;
import com.sunil.SCM2.DTO.UserForm;
import com.sunil.SCM2.entity.User;
import com.sunil.SCM2.helpers.Helper;
import com.sunil.SCM2.services.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;

	@GetMapping("/dashboard")
	public String userDashbord(Model model) {
		model.addAttribute("activePage", "dashboard");
		return "user/dashbord";
	}
	
	@PostMapping("/dashboard")
	public String postUserDashbord(Model model) {
		model.addAttribute("activePage", "dashboard");
		return "user/dashbord";
	}
	
	@GetMapping("/profile")
	public String userProfile(Model model, Authentication authentication) {
		String userName = Helper.findUserNameByAuthentication(authentication);
		User user = userService.getUserByEmailID(userName);
		UserForm userForm = new UserForm();
		userForm.setName(user.getName());
		userForm.setAbout(user.getAbout());
		userForm.setContact(user.getPhoneNumber());
		userForm.setEmail(user.getEmail());
		model.addAttribute("user", userForm);
		model.addAttribute("activePage", "profile");
		return "user/profile";
	}
	
	@GetMapping("/contactPage") 
	public String registerPage(Model model) {
		model.addAttribute("contactForm", new ContactForm());
		model.addAttribute("activePage", "contactForm");
		return "user/contact";
	}
}
