package com.springBoot.jsp.OES.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity(name="add_category")
public class Category {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="cat_Id")
	private int Id;
	private String Cat_title;
	@Column(name="cat_Discription")
	private String  cat_description;
	

	public Category( int Id, String cat_title,String cat_description) {
	      this.Id = Id;
		this.Cat_title = cat_title;
		this.cat_description = cat_description;
	}


	public Category() {
		// TODO Auto-generated constructor stub
	}


	public Category(String cat_title, String cat_description) {
		this.Cat_title = cat_title;
		this.cat_description = cat_description;
	}


	public int getId() {
		return Id;
	}


	public void setId(int id) {
		Id = id;
	}


	public String getCat_title() {
		return Cat_title;
	}


	public void setCat_title(String cat_title) {
		Cat_title = cat_title;
	}


	public String getCat_description() {
		return cat_description;
	}


	public void setCat_description(String cat_description) {
		this.cat_description = cat_description;
	}
	
	
}