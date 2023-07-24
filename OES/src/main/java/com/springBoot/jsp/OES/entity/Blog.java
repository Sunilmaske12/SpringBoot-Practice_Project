package com.springBoot.jsp.OES.entity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity(name="myblogs")
public class Blog {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="B_Id")
	private int b_id;
	@Column(name="Blog_Photo_Name")
	private String blog_name;
	@Column(name="Blog_description")
	private String blog_description;
	@Column(name="Blog_Title")
	private String blog_title;

	public Blog(int b_id, String blog_name, String blog_description, String blog_title) {
		super();
		this.b_id = b_id;
		this.blog_name = blog_name;
		this.blog_description = blog_description;
		this.blog_title = blog_title;
	}

	public Blog() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getB_id() {
		return b_id;
	}

	public void setB_id(int b_id) {
		this.b_id = b_id;
	}

	public String getBlog_name() {
		return blog_name;
	}

	public void setBlog_name(String blog_name) {
		this.blog_name = blog_name;
	}

	public String getBlog_description() {
		return blog_description;
	}

	public void setBlog_description(String blog_description) {
		this.blog_description = blog_description;
	}
	
	
	

	

	public String getBlog_title() {
		return blog_title;
	}

	public void setBlog_title(String blog_title) {
		this.blog_title = blog_title;
	}

	@Override
	public String toString() {
		return "Blog [b_id=" + b_id + ", blog_name=" + blog_name + ", blog_description=" + blog_description
				+ ", blog_title=" + blog_title + "]";
	}

	
	
	
	

}
