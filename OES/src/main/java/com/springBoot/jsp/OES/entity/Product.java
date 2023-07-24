package com.springBoot.jsp.OES.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="product_operation")
public class Product {
	
	@Id
	@GeneratedValue(strategy =  GenerationType.IDENTITY)
	@Column(name="prod_id")
	private int id;
	private String prod_name = null;
	private String prod_description = null;
	private String prod_price = null;
	private String prod_discount = null;
	private String prod_quantity = null;
	@Column(name="image_Name")
	private String prod_imageName = null;
	private int cid =0;
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Product(int id, String prod_name, String prod_description, String prod_price, String prod_discount,
			String prod_quantity, String prod_imageName, int cid) {
		super();
		this.id = id;
		this.prod_name = prod_name;
		this.prod_description = prod_description;
		this.prod_price = prod_price;
		this.prod_discount = prod_discount;
		this.prod_quantity = prod_quantity;
		this.prod_imageName = prod_imageName;
		this.cid = cid;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	public String getProd_description() {
		return prod_description;
	}
	public void setProd_description(String prod_description) {
		this.prod_description = prod_description;
	}
	public String getProd_price() {
		return prod_price;
	}
	public void setProd_price(String prod_price) {
		this.prod_price = prod_price;
	}
	public String getProd_discount() {
		return prod_discount;
	}
	public void setProd_discount(String prod_discount) {
		this.prod_discount = prod_discount;
	}
	public String getProd_quantity() {
		return prod_quantity;
	}
	public void setProd_quantity(String prod_quantity) {
		this.prod_quantity = prod_quantity;
	}
	public String getProd_imageName() {
		return prod_imageName;
	}
	public void setProd_imageName(String prod_imageName) {
		this.prod_imageName = prod_imageName;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	
	public int getPriceAfterDiscount() {
		int price = (int) (Integer.parseInt(this.prod_price) - (Integer.parseInt(this.prod_price)*Integer.parseInt(this.prod_discount)*0.01));
		return price;
	}
	
	

}
