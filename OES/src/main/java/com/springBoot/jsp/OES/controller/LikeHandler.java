package com.springBoot.jsp.OES.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/User")
public class LikeHandler {
	
	@GetMapping("/likeProduct")
	public String showLike() {
		return "like_product";
	}
}
