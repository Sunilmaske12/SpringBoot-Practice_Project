package com.sunil.SCM2.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.sunil.SCM2.entity.Contact;
import com.sunil.SCM2.entity.User;
import com.sunil.SCM2.repositories.ContactRepo;

@Service
public class ContactServiceImpl implements ContactService {

	@Autowired
	private ContactRepo contactRepo;

	@Override
	public void save(Contact contact) {
		contactRepo.save(contact);
	}

	@Override
	public Page<Contact> getContacts(User user, String searchBy, String searchValue, int pageSize, int pageNumber) {
		Pageable pageable = PageRequest.of(pageNumber, pageSize);

		switch (searchBy) {

		    case "NAME":
		        return contactRepo.findByUserAndNameContainingIgnoreCase(
		                user, searchValue.trim(), pageable);
	
		    case "EMAIL":
		        return contactRepo.findByUserAndEmailContainingIgnoreCase(
		                user, searchValue.trim(), pageable);
	
		    case "PHONE":
		        return contactRepo.findByUserAndPhoneNumberContainingIgnoreCase(
		                user, searchValue.trim(), pageable);
	
		    default:
		        return contactRepo.findByUser(user, pageable);
		}

	}

	@Override
	public List<Contact> getContacts(User user) {
		return contactRepo.findByUser(user);
	}

	@Override
	public void deleteContact(int contactID) {
		contactRepo.deleteById(contactID);
	}

	@Override
	public Contact getContactByID(int contactID) {
		return contactRepo.findById(contactID).orElse(null);
	}

}
