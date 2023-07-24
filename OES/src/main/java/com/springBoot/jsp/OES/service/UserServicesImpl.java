package com.springBoot.jsp.OES.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springBoot.jsp.OES.dao.UserRepository;
import com.springBoot.jsp.OES.entity.User;


@Service
public class UserServicesImpl implements UserServices {
	
	@Autowired
	private UserRepository userRepository;
	
	@Override
	public void saveUser(User user) {
             userRepository.save(user);
	}

	@Override
	public List<User> getAllUsers() {
		return userRepository.findAll();
	}

	@Override
	public void deleteUserById(int id) {
		userRepository.deleteById(id);		
	}

	@Override
	public User getUserById(int id) {
		Optional<User> userById =  userRepository.findById(id);
		User user=userById.get();
		return user;
	}

	@Override
	public int getTotalUserCount() {		
		return (int) userRepository.count();
	}

	@Override
	public int getNewUserCount() {
		return userRepository.countBySeen("no");
	}

}
