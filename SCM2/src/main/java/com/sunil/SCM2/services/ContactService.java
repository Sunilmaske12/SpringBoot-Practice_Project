package com.sunil.SCM2.services;

import java.util.List;

import org.springframework.data.domain.Page;
import com.sunil.SCM2.entity.Contact;
import com.sunil.SCM2.entity.User;

public interface ContactService {

	void save(Contact contact);
	
	Page<Contact> getContacts(User user, String searchBy, String searchValue, int pageSize, int pageNumber);
	
	List<Contact> getContacts(User user);

	void deleteContact(int contactID);

	Contact getContactByID(int contactID);

}
