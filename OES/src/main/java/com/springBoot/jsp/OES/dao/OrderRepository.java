package com.springBoot.jsp.OES.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.springBoot.jsp.OES.entity.Order;

public interface OrderRepository extends JpaRepository<Order, Integer> {

	List<Order> findByUserId(int id);

	@Query("select SUM(Total_Amount) from Order")
	int getTotalSells();
	
	int countBySeen(String string);

}

