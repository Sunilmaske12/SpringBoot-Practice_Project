package com.springBoot.jsp.OES.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity(name="customer_address")
public class Customer {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="Address_Id")
	int c_id ;    
	@Column(name="Customer_Name")
	 String c_name= null;
	@Column(name="Contact")
	 String c_mobno = null;
	@Column(name="Address")
	 String c_adderess ;
	@Column(name="Email")
	 String c_email = null;
	@Column(name="Landmark")
	 String c_landmark = null;
	@Column(name="Address_Type")
	 String c_AddressType = null;
		@Column(name="City")
	 String c_city = null;
		@Column(name="Pincode")
	 String c_pincode = null;
		@Column(name="user_Id")
	 String u_id = null;
	
	public Customer() {
		
	}
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_mobno() {
		return c_mobno;
	}
	public void setC_mobno(String c_mobno) {
		this.c_mobno = c_mobno;
	}
	public String getC_adderess() {
		return c_adderess;
	}
	public void setC_adderess(String c_adderess) {
		this.c_adderess = c_adderess;
	}
	public String getC_email() {
		return c_email;
	}
	public void setC_email(String c_email) {
		this.c_email = c_email;
	}
	public String getC_landmark() {
		return c_landmark;
	}
	public void setC_landmark(String c_landmark) {
		this.c_landmark = c_landmark;
	}
	public String getC_AddressType() {
		return c_AddressType;
	}
	public void setC_AddressType(String c_AddressType) {
		this.c_AddressType = c_AddressType;
	}
	public String getC_city() {
		return c_city;
	}
	public void setC_city(String c_city) {
		this.c_city = c_city;
	}
	public String getC_pincode() {
		return c_pincode;
	}
	public void setC_pincode(String c_pincode) {
		this.c_pincode = c_pincode;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	
}