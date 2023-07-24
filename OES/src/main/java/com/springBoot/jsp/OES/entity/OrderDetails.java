package com.springBoot.jsp.OES.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity(name="customer_order_details")
public class OrderDetails {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="COD_No")
	private int customerOrderDetailId;
	@Column(name="Oid")
	private int oid;
	private int Product_Id;
	private String Product_Name;
	private String Product_Price;
	private String Product_Quantity;
	
	
	public int getCustomerOrderDetailId() {
		return customerOrderDetailId;
	}
	public void setCustomerOrderDetailId(int customerOrderDetailId) {
		this.customerOrderDetailId = customerOrderDetailId;
	}
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public int getProduct_Id() {
		return Product_Id;
	}
	public void setProduct_Id(int product_Id) {
		Product_Id = product_Id;
	}
	public String getProduct_Name() {
		return Product_Name;
	}
	public void setProduct_Name(String product_Name) {
		Product_Name = product_Name;
	}
	public String getProduct_Price() {
		return Product_Price;
	}
	public void setProduct_Price(String product_Price) {
		Product_Price = product_Price;
	}
	public String getProduct_Quantity() {
		return Product_Quantity;
	}
	public void setProduct_Quantity(String product_Quantity) {
		Product_Quantity = product_Quantity;
	}
	
	
	
}
