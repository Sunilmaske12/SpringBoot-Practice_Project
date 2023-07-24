package com.springBoot.jsp.OES.service;

import com.springBoot.jsp.OES.entity.Customer;

public interface CustomerServices {

	Customer getCustomerById(int aid);

	String getCustomerName(String aid);

}
