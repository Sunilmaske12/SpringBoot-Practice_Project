package com.sunil.SCM2.repositories;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.sunil.SCM2.entity.Contact;
import com.sunil.SCM2.entity.User;

public interface ContactRepo extends JpaRepository<Contact, Integer>{

	Page<Contact> findByUser(User user, Pageable page);
	
	Page<Contact> findByUserAndNameContainingIgnoreCase(User user, String name,  Pageable page);
	
	Page<Contact> findByUserAndEmailContainingIgnoreCase(User user, String email,  Pageable page);
	
	Page<Contact> findByUserAndPhoneNumberContainingIgnoreCase(User user, String phoneNumber,  Pageable page);
	
	List<Contact> findByUser(User user);

}
