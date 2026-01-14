package com.sunil.SCM2.controller;

import com.sunil.SCM2.entity.User;
import com.sunil.SCM2.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.sunil.SCM2.entity.Contact;
import com.sunil.SCM2.services.ContactService;

@RestController
@RequestMapping("/api")
public class ApiController {
	
	@Autowired
	private ContactService contactService;

	@GetMapping("/contact/{contactID}")
	public Contact getContact(@PathVariable int contactID) {
		return contactService.getContactByID(contactID);
	}


}
