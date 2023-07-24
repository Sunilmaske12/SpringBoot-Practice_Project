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
import com.springBoot.jsp.OES.entity.Category;
import com.springBoot.jsp.OES.entity.User;
import com.springBoot.jsp.OES.securityConfig.CustomUserDetails;
import com.springBoot.jsp.OES.service.BannerServices;
import com.springBoot.jsp.OES.service.ContactServices;
import com.springBoot.jsp.OES.service.OrderServices;
import com.springBoot.jsp.OES.service.ProductService;
import com.springBoot.jsp.OES.service.UserServices;


@Controller
public class HomeController {

	@Autowired
	private ProductService productService;

	@Autowired
	private BannerServices bannerService;
	
	@Autowired
	private UserServices userServices;
	
	@Autowired
	private OrderServices orderServices;
	
	@Autowired
	private ContactServices contactServices;
	
	
	@RequestMapping("/")
		public String indexPage(Model model, @AuthenticationPrincipal CustomUserDetails userDetail) {
		List<Category> allCategories = productService.getAllCategories();
		List<Banner> allBanner = bannerService.getAllBanner();
		model.addAttribute("allCategories", allCategories);
		model.addAttribute("allBanner", allBanner);
		model.addAttribute("user", userDetail); 
		return "index";
	}

	@GetMapping("/loginForm")
	public String getLoginPage(Model model) {
		// DailyBusiness dailyOnline
		return "loginform";
	}
	
	

	

	
	

	@GetMapping("/Admin/viewCategory")
	public String getviewCategorypage(Model model, @AuthenticationPrincipal CustomUserDetails userDetail) {
		User adminInfo = userServices.getUserById(userDetail.getId());
		List<Category> allCategories = productService.getAllCategories();
		model.addAttribute("aminInfo", adminInfo);
		model.addAttribute("allCategories", allCategories);
		return "View_Category";
	}
	
	@GetMapping("/Admin/deleteCategory{cid}")
	public String deleteCategory(@PathVariable("cid") int cid) {
		productService.deleteCategoryById(cid);
		return "redirect:/Admin/viewCategory";
	}
	
	
	

	@GetMapping("/Admin/addProduct")
	public String getAddProductPage(Model model) {
		// DailyBusiness dailyOnline
		return "Add-product";
	}

	@GetMapping("/Admin/calender")
	public String getCalenderPage(Model model, @AuthenticationPrincipal CustomUserDetails userDetail) {
		User adminInfo = userServices.getUserById(userDetail.getId());
		model.addAttribute("aminInfo", adminInfo);
		// DailyBusiness dailyOnline
		return "calender";
	}

	@GetMapping("/User/support")
	public String getSupportPage(Model model, @AuthenticationPrincipal CustomUserDetails userDetail) {
		User adminInfo = userServices.getUserById(userDetail.getId());
		model.addAttribute("aminInfo", adminInfo);
		return "support";
	}

	

	
	@GetMapping("/Admin/adminPannel")
	public String getDashboard(Model model, @AuthenticationPrincipal CustomUserDetails userDetail) {
		User adminInfo = userServices.getUserById(userDetail.getId());
		int totalUsers = userServices.getTotalUserCount();
		int totalOrders = orderServices.getTotalOrders();
		int totalSales = orderServices.getTotalSell();
		int newUsers = userServices.getNewUserCount();
		int newOrders = orderServices.getNewOrdersCount();
		int newQuery = contactServices.getNewQueryCount();
		int notificationCount = 0;
				if(newUsers!=0) notificationCount+=1;
				if(newOrders!=0) notificationCount+=1;
				if(newQuery!=0) notificationCount+=1;
		
		model.addAttribute("totalUsers", totalUsers);
		model.addAttribute("totalOrders", totalOrders);
		model.addAttribute("totalSales", totalSales);
		model.addAttribute("totalEarning", totalSales*0.20);
		model.addAttribute("aminInfo", adminInfo);
		model.addAttribute("newUsers", newUsers);
		model.addAttribute("newOrders", newOrders);
		model.addAttribute("newQuery", newQuery);
		model.addAttribute("notificationCount", notificationCount);
	
		return "dashbord";
	}

	
	 
}
