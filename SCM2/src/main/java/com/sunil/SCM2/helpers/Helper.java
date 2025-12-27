package com.sunil.SCM2.helpers;

import java.security.Principal;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;

import com.sunil.SCM2.entity.User;

public class Helper {
	
	public static String findUserNameByAuthentication(Authentication authentication) {
		if(authentication == null) return null;
				
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		return userDetails.getUsername();
	}

}
