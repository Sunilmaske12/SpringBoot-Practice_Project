package com.springBoot.jsp.OES.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.springBoot.jsp.OES.entity.Customer;

public interface CustomerRepository extends JpaRepository<Customer, Integer> {
	
	@Query("select c.c_name from customer_address c where c.c_id =:aid")
	String getCustomerName(@Param("aid") String aid);

}
