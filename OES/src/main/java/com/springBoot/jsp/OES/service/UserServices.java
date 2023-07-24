package com.springBoot.jsp.OES.service;

import java.util.List;

import com.springBoot.jsp.OES.entity.User;

public interface UserServices {
	
	public void saveUser(User user);

	public List<User> getAllUsers();

	public void deleteUserById(int id);

	public User getUserById(int id);

	public int getTotalUserCount();

	public int getNewUserCount();

}
