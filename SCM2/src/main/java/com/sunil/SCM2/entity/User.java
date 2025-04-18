package com.sunil.SCM2.entity;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.sunil.SCM2.enums.Providers;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@Entity
@Builder
@Table(name = "USER")
public class User implements UserDetails {

	@Id
	private String userID;
	private String name;
	@Column(nullable = false, unique = true)
	private String email;
	
	@Getter(value = AccessLevel.NONE)
	private String password;
	@Column(length = 1000)
	private String about;
	private String profilePic;
	private String phoneNumber;
	
	@Builder.Default
	private boolean enabled = true;
	private boolean emailVerified;
	private boolean phoneVerified;
	
	@Builder.Default
	private Providers provider = Providers.SELF;
	private String providerUserId;
	
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.LAZY, orphanRemoval = true)
	private List<Contact> contacts = new ArrayList<>();

	@ElementCollection(fetch = FetchType.EAGER)
	private List<String> roleList = new ArrayList<>();
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return roleList.stream()
				.map(role -> new SimpleGrantedAuthority(role)).collect(Collectors.toList());
	}

	@Override
	public String getUsername() {
		return this.email;
	}

	@Override
	public String getPassword() {
		return this.password;
	}
}
