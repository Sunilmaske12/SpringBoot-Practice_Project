package com.sunil.SCM2.services;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunil.SCM2.entity.User;
import com.sunil.SCM2.exception.ResourceNotFoundException;
import com.sunil.SCM2.repositories.UserRepo;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepo userRepo;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public User saveUser(User user) {
		String userID = UUID.randomUUID().toString();
		user.setUserID(userID);
		return userRepo.save(user);
	}

	@Override
	public Optional<User> getUserById(String id) {
		User user = userRepo.findById(id)
				.orElseThrow(() -> new ResourceNotFoundException("User not found"));
		return Optional.ofNullable(user);
	}

	@Override
	public Optional<User> updateUser(User user) {
		
		//validating user
		userRepo.findById(user.getUserID())
		.orElseThrow(() -> new ResourceNotFoundException("User not found"));
		
		return Optional.ofNullable(userRepo.save(user));
	}

	@Override
	public void deleteUser(String id) {
		User user = userRepo.findById(id)
				.orElseThrow(() -> new ResourceNotFoundException("User not found"));
		userRepo.delete(user);
	}

	@Override
	public boolean isUserExist(String userId) {
		return userRepo.findById(userId) != null;
	}

	@Override
	public boolean isUserExistByEmail(String email) {
		return userRepo.findByEmail(email) != null;
	}

	@Override
	public List<User> getAllUsers() {
		return userRepo.findAll();
	}

}
