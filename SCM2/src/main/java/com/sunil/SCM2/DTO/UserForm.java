package com.sunil.SCM2.DTO;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserForm {
	
	@NotBlank(message = "Username is required")
	@Size(min = 3, message = "Min 3 characters required")
	private String name;
	
	@NotBlank(message = "Email is required")
	@Email(message ="Invalid email address")
	private String email;
	@NotBlank(message = "Password is required")
	@Size(min = 6, message = "Min 6 characters is required")
	private String password;
	@Size(min = 8, max = 12, message = "Invalid phone number")
	private String contact;
	private String about;	

}
