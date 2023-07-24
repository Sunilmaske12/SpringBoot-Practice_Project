package com.springBoot.jsp.OES.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springBoot.jsp.OES.dao.OrderDetailsRepository;
import com.springBoot.jsp.OES.dao.OrderRepository;
import com.springBoot.jsp.OES.entity.Order;
import com.springBoot.jsp.OES.entity.OrderDetails;

@Service
public class OrderServicesImpl implements OrderServices {
	
	@Autowired
	private OrderRepository orderRepository;
	
	@Autowired
	private OrderDetailsRepository orderDetailsRepository;
	
	@Override
	public List<Order> getAllOrder() {
		List<Order> result = orderRepository.findAll();
		return result;
	}

	@Override
	public List<OrderDetails> getOrderDetailById(int oid) {
		List<OrderDetails> orderDetail=orderDetailsRepository.findByOid(oid);
		return orderDetail;
	}

	@Override
	public List<Order> getAllOrderById(int id) {
		return orderRepository.findByUserId(id);
	}

	@Override
	public int getTotalOrders() {
		return orderRepository.findAll().size();
	}

	@Override
	public int getTotalSell() {
		return orderRepository.getTotalSells();
	}

	@Override
	public int getNewOrdersCount() {
		return orderRepository.countBySeen("No");
	}

	@Override
	public void updateStatus(String action, int oid) {
		Optional<Order> getOrder = orderRepository.findById(oid);
		Order order = getOrder.get();
		order.setStatus(action);
		orderRepository.save(order);
	
		
	}

}
