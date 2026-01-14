package com.sunil.SCM2.services;

import java.util.List;
import java.util.Optional;

import com.sunil.SCM2.DTO.UserForm;
import com.sunil.SCM2.entity.User;
import com.sunil.SCM2.exception.CustomException;

public interface UserService {
	
	User saveUser(User user);
	
	Optional<User> getUserById(String id);
	
	Optional<User> updateUser(User user);
	
	void deleteUser(String id);
	
	boolean isUserExist(String userId);
	
	boolean isUserExistByEmail(String email);
	
	List<User> getAllUsers();
	
	User getUserByEmailID(String email);

    void validateUserRegistration(UserForm userForm) throws CustomException;

    User getUserByEmailToken(String emailToken);
}
