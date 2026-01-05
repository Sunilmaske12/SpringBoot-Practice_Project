package com.sunil.SCM2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sunil.SCM2.DTO.UserForm;

import org.springframework.ui.Model;

@Controller
@RequestMapping("/view")
public class ViewController {
	
	@RequestMapping("/test") 
	public String test() {
		return "test";
	}
	
	@RequestMapping("/fragment1") 
	public String base() {
		return "fragementTest/fragment1";
	}
	
	@RequestMapping("/child") 
	public String child() {
		return "fragementTest/child";
	}
	
	@RequestMapping("/home") 
	public String home(Model model) {
		model.addAttribute("activePage", "home");
		return "home";
	}
	
	@RequestMapping("/service") 
	public String service(Model model) {
		model.addAttribute("activePage", "service");
		return "service";
	}
	
	@RequestMapping("/about") 
	public String about(Model model) {
		model.addAttribute("activePage", "about");
		return "about";
	}
	
	@RequestMapping("/index") 
	public String index(Model model) {
		model.addAttribute("activePage", "index");
		return "index";
	}
	
	@RequestMapping("/loginPage") 
	public String login() {
		return "login";
	}
	
	@RequestMapping("/registerPage") 
	public String registerPage(Model model) {
		model.addAttribute("userForm", new UserForm());
		return "register";
	}

}
