package com.sunil.SCM2.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sunil.SCM2.DTO.ContactForm;
import com.sunil.SCM2.entity.Contact;
import com.sunil.SCM2.entity.User;
import com.sunil.SCM2.helpers.Helper;
import com.sunil.SCM2.services.ContactService;
import com.sunil.SCM2.services.UploadFileService;
import com.sunil.SCM2.services.UserService;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/user/contact")
public class ContactController {

	@Autowired
	private UserService userService;

	@Autowired
	private ContactService contactService;

	@Autowired
	private UploadFileService uploadFileService;

	@GetMapping("/")
	public String contactForm(Model model) {
		model.addAttribute("contactForm", new ContactForm());
		return "/user/contact";
	}
	
	@GetMapping("/list-pagination")
	public String contactList(Model model, Authentication authentication, 
			@RequestParam(value = "page" , defaultValue = "0") int page, 
			@RequestParam(value = "size" , defaultValue = "4") int size,
			@RequestParam(value = "searchBy" , defaultValue = "") String searchBy,
			@RequestParam(value = "searchValue" , defaultValue = "") String searchValue
			
			) {
		
		String userName = Helper.findUserNameByAuthentication(authentication);
		User user = userService.getUserByEmailID(userName);
		Page<Contact> contactPage = contactService.getContacts(user, searchBy, searchValue, size, page);
		System.out.println(contactPage.getNumber());
		
		
		
		
		model.addAttribute("contactPage", contactPage);

		return "/user/contactList";
	}


	@GetMapping("/list")
	public String contactList(Model model, Authentication authentication) {
		String userName = Helper.findUserNameByAuthentication(authentication);
		User user = userService.getUserByEmailID(userName);
		List<Contact> contacts = contactService.getContacts(user);
		System.out.println(contacts.size());
		model.addAttribute("contactList", contacts);

		return "/user/contactList";
	}

	@PostMapping("/add")
	public String addContact(@Valid @ModelAttribute ContactForm contactForm, BindingResult result, Model model,
			Authentication authentication) {

		if (result.hasErrors()) {

			result.getAllErrors().forEach(err -> {
				System.out.println(err);
			});

			return "/user/contact";
		}

		String userName = Helper.findUserNameByAuthentication(authentication);

		String filePath = uploadFileService.uploadImage(contactForm.getPicture());

		User user = userService.getUserByEmailID(userName);
		Contact contact = new Contact(0, contactForm.getName(), contactForm.getEmail(), contactForm.getContact(),
				contactForm.getAddress(), filePath, contactForm.getDescription(), contactForm.isFavorite(),
				contactForm.getWebsiteLink(), contactForm.getLinkedInLink(), user, null);

		contactService.save(contact);

		return "redirect:/user/contact/";
	}

	@GetMapping("/delete/{contactID}")
	public String deleteContact(@PathVariable int contactID) {

		contactService.deleteContact(contactID);

		return "redirect:/user/contact/list";

	}

	@GetMapping("/view/update-contact/{contactID}")
	public String viewUpdateContact(@PathVariable int contactID, Model model) {
		Contact contact = contactService.getContactByID(contactID);
		ContactForm contactForm = new ContactForm();
		contactForm.setAddress(contact.getAddress());
		contactForm.setContact(contact.getPhoneNumber());
		contactForm.setDescription(contact.getDescription());
		contactForm.setEmail(contact.getEmail());
		contactForm.setFavorite(contact.isFavorite());
		contactForm.setLinkedInLink(contact.getLinkedInLink());
		contactForm.setWebsiteLink(contact.getWebsiteLink());
		contactForm.setProfilePicUrl(contact.getPicture());
		contactForm.setName(contact.getName());
		model.addAttribute("contactForm", contactForm);
		model.addAttribute("contactID", contactID);
		return "/user/update_contact";
	}

	@PostMapping("/update/{contactID}")
	public String updateContact(@PathVariable int contactID, @Valid @ModelAttribute ContactForm contactForm,
			BindingResult result, Model model, Authentication authentication) {
		
		if (result.hasErrors()) {

			result.getAllErrors().forEach(err -> {
				System.out.println(err);
			});

			return "/user/contact";
		}
		
		Contact oldContact = contactService.getContactByID(contactID);

		if(contactForm.getPicture() != null && !contactForm.getPicture().isEmpty()) {
			String filePath = uploadFileService.uploadImage(contactForm.getPicture());
			oldContact.setPicture(filePath);			
		}

		oldContact.setName(contactForm.getName());
		oldContact.setEmail(contactForm.getEmail());
		oldContact.setPhoneNumber(contactForm.getContact());
		oldContact.setAddress(contactForm.getAddress());
		oldContact.setDescription(contactForm.getDescription());
		oldContact.setFavorite(contactForm.isFavorite());
		oldContact.setLinkedInLink(contactForm.getLinkedInLink());
		oldContact.setWebsiteLink(contactForm.getWebsiteLink());
		
		contactService.save(oldContact);

		return "redirect:/user/contact/";
	}

}
