package com.springBoot.jsp.OES.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springBoot.jsp.OES.entity.Banner;
import com.springBoot.jsp.OES.entity.User;
import com.springBoot.jsp.OES.securityConfig.CustomUserDetails;
import com.springBoot.jsp.OES.service.BannerServices;
import com.springBoot.jsp.OES.service.UserServices;

@Controller
@RequestMapping("/Admin")
public class BannerHandler {
	
	@Autowired
	private BannerServices bannerServices;
	
	@Autowired 
	private UserServices userServices;
	
	@GetMapping("/allBanner")
	public String getBannerPage(Model model, @AuthenticationPrincipal CustomUserDetails userDetail) {
		User adminInfo = userServices.getUserById(userDetail.getId());
		model.addAttribute("aminInfo", adminInfo);
		List<Banner> allBanner = bannerServices.getAllBanner();
		model.addAttribute("Banner", allBanner);
	
		return "Banner";
	}
	
	@GetMapping("/addBanner")
	public String addBanner(Model model) {
			return "AddBanner";
	}
	
	@GetMapping("/statusServlet,{action},{Bid}")
	public String updateBannerStatus(Model model, @PathVariable("action") String Action, @PathVariable("Bid") int Bid) {
		//List<Banner> allBanner = bannerServices.getAllBanner();
		bannerServices.updateStatus(Action, Bid);
		//model.addAttribute("Banner", allBanner);
		return "redirect:/allBanner";
	}
	
	@GetMapping("/deleteBanner{Bid}")
	public String deleteBanner(Model model,  @PathVariable("Bid") int Bid) {
		bannerServices.deleteBanner(Bid);
			return "redirect:/allBanner";
	}
	
	
}
