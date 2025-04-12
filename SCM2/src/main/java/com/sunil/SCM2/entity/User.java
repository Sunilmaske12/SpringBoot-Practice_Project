package com.sunil.SCM2.entity;

import java.util.ArrayList;
import java.util.List;

import com.sunil.SCM2.enums.Providers;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@Entity
@Builder
@Table(name = "USER")
public class User {

	@Id
	private String userID;
	private String name;
	@Column(nullable = false, unique = true)
	private String email;
	private String password;
	@Column(length = 1000)
	private String about;
	private String profilePic;
	private String phoneNumber;
	
	private boolean enabled;
	private boolean emailVerified;
	private boolean phoneVerified;
	
	private Providers provider = Providers.SELF;
	private String providerUserId;
	
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.LAZY, orphanRemoval = true)
	private List<Contact> contacts = new ArrayList<>();
}
