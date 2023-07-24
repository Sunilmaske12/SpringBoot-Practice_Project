package com.springBoot.jsp.OES.entity;
import java.sql.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="customer_order")
public class Order {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int order_Id;
	Date Date;
	String time;
	@Column(name="C_Address_Id")
	String address_Id;
	@Column(name="User_Id")
	int userId;
	private int Amount;
	@Column(name="Shipping_Charges")
	int charges;
	private int Total_Amount;
	String Payment_Mode;
	String Status;
	String seen;
	String Razorpay_Order_Id;
	
	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getOrder_Id() {
		return order_Id;
	}
	public void setOrder_Id(int order_Id) {
		this.order_Id = order_Id;
	}
	public Date getDate() {
		return Date;
	}
	public void setDate(Date date) {
		Date = date;
	}
	public String getAddress_Id() {
		return address_Id;
	}
	public void setAddress_Id(String address_Id) {
		this.address_Id = address_Id;
	}
	public int getAmount() {
		return Amount;
	}
	public void setAmount(int amount) {
		Amount = amount;
	}
	public int getCharges() {
		return charges;
	}
	public void setCharges(int charges) {
		this.charges = charges;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		this.Status = status;
	}
	public int getTotal_Amount() {
		return Total_Amount;
	}
	public void setTotal_Amount(int total_Amount) {
		Total_Amount = total_Amount;
	}
	public String getSeen() {
		return seen;
	}
	public void setSeen(String seen) {
		this.seen = seen;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getPayment_Mode() {
		return Payment_Mode;
	}
	public void setPayment_Mode(String payment_Mode) {
		Payment_Mode = payment_Mode;
	}
	public String getRazorpay_Order_Id() {
		return Razorpay_Order_Id;
	}
	public void setRazorpay_Order_Id(String razorpay_Order_Id) {
		Razorpay_Order_Id = razorpay_Order_Id;
	}
	
	
 
}
