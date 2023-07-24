package com.springBoot.jsp.OES.entity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="user_registration")
public class User {
	
	@Id
	@GeneratedValue(strategy =  GenerationType.IDENTITY)
	@Column(name="user_id")
	  private int id;
      private String user_name;
      private String user_mobno;
      private String user_adderess;
      private String user_emailid;
      private String user_pass;
	  private String  user_type="Normal User";
	  private String seen="No";
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_mobno() {
		return user_mobno;
	}
	public void setUser_mobno(String user_mobno) {
		this.user_mobno = user_mobno;
	}
	public String getUser_adderess() {
		return user_adderess;
	}
	public void setUser_adderess(String user_adderess) {
		this.user_adderess = user_adderess;
	}
	public String getUser_emailid() {
		return user_emailid;
	}
	public void setUser_emailid(String user_emailid) {
		this.user_emailid = user_emailid;
	}
	public String getUser_pass() {
		return user_pass;
	}
	public void setUser_pass(String user_pass) {
		this.user_pass = user_pass;
	}
	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	public String getSeen() {
		return seen;
	}
	public void setSeen(String seen) {
		this.seen = seen;
	}
	
	
	
}