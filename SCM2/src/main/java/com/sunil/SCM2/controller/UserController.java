package com.sunil.SCM2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {

	@GetMapping("/dashboard")
	public String userDashbord() {
		return "user/dashbord";
	}
	
	@GetMapping("/profile")
	public String userProfile() {
		return "user/profile";
	}
}
