package com.springBoot.jsp.OES.service;

import java.util.List;

import com.springBoot.jsp.OES.entity.Order;
import com.springBoot.jsp.OES.entity.OrderDetails;

public interface OrderServices {

	public List<Order> getAllOrder();

	public List<OrderDetails> getOrderDetailById(int oid);

	public List<Order> getAllOrderById(int id);

	public int getTotalOrders();

	public int getTotalSell();

	public int getNewOrdersCount();

	public void updateStatus(String action, int oid);

}
