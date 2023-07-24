package com.springBoot.jsp.OES.securityConfig;

import java.util.Collection;
import java.util.List;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.springBoot.jsp.OES.entity.User;

public class CustomUserDetails  implements UserDetails  {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		SimpleGrantedAuthority sga=new SimpleGrantedAuthority(user.getUser_type());
		return List.of(sga);
	}
	
	
	private User user;
	
	public CustomUserDetails(User user){
		this.user = user;
	}
	
	
	@Override
	public String getPassword() {
		return user.getUser_pass();
	}

	@Override
	public String getUsername() {
		return user.getUser_emailid();
	}
	
	public String getName() {
		return user.getUser_name();
	} 
	
	public int getId() {
		return user.getId();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

}
