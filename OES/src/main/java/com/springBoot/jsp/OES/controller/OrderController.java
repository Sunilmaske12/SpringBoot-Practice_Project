package com.springBoot.jsp.OES.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.springBoot.jsp.OES.entity.Customer;
import com.springBoot.jsp.OES.entity.Order;
import com.springBoot.jsp.OES.entity.OrderDetails;
import com.springBoot.jsp.OES.entity.User;
import com.springBoot.jsp.OES.securityConfig.CustomUserDetails;
import com.springBoot.jsp.OES.service.OrderServices;
import com.springBoot.jsp.OES.service.UserServices;
import com.springBoot.jsp.OES.service.CustomerServices;


@Controller
public class OrderController {
	
	@Autowired
	private OrderServices orderServices;
	
	@Autowired
	private CustomerServices customerServices;
	
	@Autowired
	private UserServices userServices;
	
	
	@GetMapping("/User/MyOrders")
	public String myMyOrders(Model model, @AuthenticationPrincipal CustomUserDetails userDetail) {
	List<Order> allOrders = orderServices.getAllOrderById(userDetail.getId());
	String[] customerName =new String[allOrders.size()];
	int i=0;
	for(Order l:allOrders) {
		customerName[i] = customerServices.getCustomerName(l.getAddress_Id());
		i++;
	}
	
	model.addAttribute("allOrders", allOrders);
	model.addAttribute("customerName" , customerName);
		return "MyOrders";
	}
	
	@GetMapping("/User/OrderDetails{oid},{aid}")
	public String myOrderDetails(Model model, @PathVariable("oid") int Oid,  @PathVariable("aid") int Aid) {
		Customer customer = customerServices.getCustomerById(Aid);
		List<OrderDetails> orderDetails = orderServices.getOrderDetailById(Oid); 
		int totalPrice = 0, charges=0;
		for(OrderDetails od:orderDetails) {
			totalPrice += (Integer.parseInt(od.getProduct_Price())*Integer.parseInt(od.getProduct_Quantity()));
		}
		if(totalPrice<=999) {
			charges = 100; 
		}
	model.addAttribute("customerDetails", customer);
	model.addAttribute("OrderDetails", orderDetails);
	model.addAttribute("charges", charges);
	model.addAttribute("tPrice", totalPrice);
		return "OrderDetails";
	}
	
	@GetMapping("/Admin/viewOrderAdmin")
	public String getAdminOrderPage(Model model, @AuthenticationPrincipal CustomUserDetails userDetail) {
		User adminInfo = userServices.getUserById(userDetail.getId());
		model.addAttribute("aminInfo", adminInfo);
		List<Order> allOrders = orderServices.getAllOrder();
		String[] customerName=new String[allOrders.size()];
				int i=0;
				for(Order o:allOrders) {
					customerName[i] = customerServices.getCustomerName(String.valueOf(o.getAddress_Id()));
							i++;
				}
		
		model.addAttribute("customerName", customerName);
		model.addAttribute("allOrders", allOrders);
		return "ViewOrderAdmin";
	}
	
	@GetMapping("/orderDetailsAdmin{orderId},{addressId}")
	public String getAdminOrderDetailsPage(Model model, @PathVariable("orderId") int oid, @PathVariable("addressId") int aid) {
		List<OrderDetails> orderdetails = orderServices.getOrderDetailById(oid);
		Customer getCustomer = customerServices.getCustomerById(aid);
		int totalPrice = 0, charges=0;
		for(OrderDetails od:orderdetails) {
			totalPrice += (Integer.parseInt(od.getProduct_Price())*Integer.parseInt(od.getProduct_Quantity()));
		}
		if(totalPrice<=999) {
			charges = 100; 
		}
	model.addAttribute("charges", charges);
	model.addAttribute("tPrice", totalPrice);
	
		model.addAttribute("getCustomer", getCustomer);
		model.addAttribute("orderdetails", orderdetails);
		return "OrderDetailsAdmin";
	}
	
	@GetMapping("/updateStatus,{action},{oid}")
	public String updateBannerStatus(Model model, @PathVariable("action") String Action, @PathVariable("oid") int oid) {
		orderServices.updateStatus(Action, oid);
		return "redirect:/Admin/viewOrderAdmin";
	}
	

}
