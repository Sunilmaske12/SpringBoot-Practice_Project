package com.sunil.SCM2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sunil.SCM2.DTO.ContactForm;

@Controller
@RequestMapping("/user")
public class UserController {

	@GetMapping("/dashboard")
	public String userDashbord() {
		return "user/dashbord";
	}
	
	@PostMapping("/dashboard")
	public String postUserDashbord() {
		return "user/dashbord";
	}
	
	@GetMapping("/profile")
	public String userProfile() {
		return "user/profile";
	}
	
	@GetMapping("/contactPage") 
	public String registerPage(Model model) {
		model.addAttribute("contactForm", new ContactForm());
		return "user/contact";
	}
}
