package com.springBoot.jsp.OES.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.springBoot.jsp.OES.entity.Product;


public interface ProductRepository extends JpaRepository<Product, Integer> {
	
	public List<Product> findBycid(int cid);

}

