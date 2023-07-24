package com.springBoot.jsp.OES.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.springBoot.jsp.OES.entity.Blog;
import com.springBoot.jsp.OES.service.BlogServices;

@Controller
public class BlogHandler {
	
	@Autowired
	private BlogServices blogService;
	
	@GetMapping("/blog")
	public String getBlog(Model model) {
		List<Blog> allBlog= blogService.getAllBlog();
		model.addAttribute("blogProduct" , allBlog);
		return "blog";
	}
	
	@GetMapping("/blogDetails{bid}")
	public String getBlogDetail(Model model, @PathVariable("bid") int id) {
		Blog blogDetail = blogService.getBlogById(id); 
		model.addAttribute("blogDetails", blogDetail);
		List<Blog> allBlog= blogService.getAllBlog();
		model.addAttribute("blogProduct" , allBlog);
		return "blog-details";
	}
	
	
}
