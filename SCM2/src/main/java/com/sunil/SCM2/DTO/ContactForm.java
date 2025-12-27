package com.sunil.SCM2.DTO;

import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class ContactForm {
	
	@NotBlank(message = "Username is required")
	@Size(min = 3, message = "Min 3 characters required")
	private String name;
	
	@NotBlank(message = "Email is required")
	@Email(message ="Invalid email address")
	private String email;
	@Size(min = 8, max = 12, message = "Invalid phone number")
	private String contact;
	private String address;	
	private String description;
	private String websiteLink;
	private String linkedInLink;
	private MultipartFile picture;
	private String profilePicUrl;
	private boolean favorite;

}
