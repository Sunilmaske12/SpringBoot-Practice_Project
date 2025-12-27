package com.sunil.SCM2.entity;

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class Contact {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int contactID;
	private String name;
	private String email;
	private String phoneNumber;
	private String address;
	private String picture;
	@Column(length = 1000)
	private String description;
	private boolean favorite = false;
	private String websiteLink;
	private String linkedInLink;
	
	@JsonIgnore
	@ManyToOne
	private User user;
	
	@OneToMany
	private List<SocialLink> socialLinks = new ArrayList<>();

}
