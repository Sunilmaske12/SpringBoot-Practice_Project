package com.springBoot.jsp.OES.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.springBoot.jsp.OES.dao.UserRepository;
import com.springBoot.jsp.OES.entity.User;
import com.springBoot.jsp.OES.securityConfig.CustomUserDetails;



public class UserDetailServiceImpl implements UserDetailsService {
	
	@Autowired
	private UserRepository userRepository;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user=userRepository.getUserByUserName(username);
		if(user==null) {
			System.out.println("User Not found");

			throw new UsernameNotFoundException("User Not found");
		} else {
			System.out.println(user);
		}
		
		CustomUserDetails cud=new CustomUserDetails(user);
		
		return cud;
	}

}
