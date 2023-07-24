package com.springBoot.jsp.OES.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.springBoot.jsp.OES.entity.Category;
import com.springBoot.jsp.OES.entity.Product;
import com.springBoot.jsp.OES.entity.User;
import com.springBoot.jsp.OES.securityConfig.CustomUserDetails;
import com.springBoot.jsp.OES.service.ProductService;
import com.springBoot.jsp.OES.service.UserServices;

@Controller
public class ProductHandler {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private UserServices userServices;
		
	@GetMapping("/allProduct")
	public String getShopGridPage(Model model) {
		List<Product> allProduct = productService.getAllProduct();
		List<Category> allCategory = productService.getAllCategories();
		model.addAttribute("allProduct", allProduct);
		model.addAttribute("allCategory", allCategory);
		return "shop-grid";
	}
	
	@GetMapping("/allProduct{cid}")
	public String getProductByCategory(Model model, @PathVariable("cid") int cid) {
		List<Product> allProduct = productService.getProductByCategory(cid);
		List<Category> allCategory = productService.getAllCategories();
		model.addAttribute("allProduct", allProduct);
		model.addAttribute("allCategory", allCategory);
     	return "shop-grid";
	}
	
	@GetMapping("/productDetails{id},{cid}")
	public String getProductDetail(Model model, @PathVariable("cid") int cid,  @PathVariable("id") int id) {
		List<Product> allProduct = productService.getProductByCategory(cid);
		Product product= productService.getProductById(id);
		model.addAttribute("allProduct", allProduct);
		model.addAttribute("product", product);
	   	return "Product-details";
	}
	
	@GetMapping("/Admin/viewProduct")
	public String getviewProductPage(Model model, @AuthenticationPrincipal CustomUserDetails userDetail) {
		User adminInfo = userServices.getUserById(userDetail.getId());
		model.addAttribute("aminInfo", adminInfo);
		List<Product> allProduct = productService.getAllProduct();
		model.addAttribute("allProduct", allProduct);
		return "View_product";

	}
	
	@GetMapping("/Admin/productOperation,{Action},{Pid}")
	public String userOperation(Model model, @PathVariable("Action") String action, @PathVariable("Pid") int productId) {
		switch( action){
			case "DELETE":  productService.deleteUserById(productId);
			//case "EDIT":  userServices.editUserById();
		}
		return "redirect:/viewProduct";
	}

	
	public String addNewProduct(Model model) {
		return "Add-product";
	}
	
	
	
}
