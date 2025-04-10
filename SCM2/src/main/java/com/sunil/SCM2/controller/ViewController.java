package com.sunil.SCM2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String home() {
		return "home";
	}
	
	@RequestMapping("/service") 
	public String service() {
		return "service";
	}
	
	@RequestMapping("/about") 
	public String about() {
		return "about";
	}
	
	@RequestMapping("/index") 
	public String index() {
		return "index";
	}

}
