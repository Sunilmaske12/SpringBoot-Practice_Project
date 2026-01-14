
package com.sunil.SCM2.controller;

import com.sunil.SCM2.exception.CustomException;
import com.sunil.SCM2.services.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.sunil.SCM2.DTO.Message;
import com.sunil.SCM2.DTO.UserForm;
import com.sunil.SCM2.entity.User;
import com.sunil.SCM2.enums.MessageType;
import com.sunil.SCM2.services.UserService;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.UUID;

@Controller
public class ProcessingController {
	
	@Autowired
	private UserService userService;

	@Autowired
	private EmailService emailService;
	
	@PostMapping("/do-register") 
	public String doRegister(@ModelAttribute UserForm userForm, HttpSession session, BindingResult bindingResult) {


		try {
			if (bindingResult.hasErrors()) {

				return "redirect:/view/registerPage";
			}

			//validate user

			userService.validateUserRegistration(userForm);

			String emailToken = UUID.randomUUID().toString();

			User user = User.builder()
					.name(userForm.getName())
					.email(userForm.getEmail())
					.password(userForm.getPassword())
					.about(userForm.getAbout())
					.phoneNumber(userForm.getContact())
					.emailToken(emailToken)
					.build();

			userService.saveUser(user);

			String verificationLink = emailService.getEmailVerificationLink(emailToken);
			emailService.sendMail(user.getEmail(), "Verify Email", verificationLink);

			Message message = Message.builder().content("Registration successful").messageType(MessageType.green).build();
			session.setAttribute("message", message);

		} catch (CustomException ce) {
			Message message = Message.builder().content(ce.getMessage()).messageType(MessageType.red).build();
			session.setAttribute("message", message);
		}catch (Exception e) {
			e.printStackTrace();
			Message message = Message.builder().content("Internal Server Error").messageType(MessageType.red).build();
			session.setAttribute("message", message);
		}

		return "redirect:/view/registerPage";
	}

	@GetMapping("/auth/verify-email")
	public String verifyEmail(@RequestParam("token") String token) {
		User user = userService.getUserByEmailToken(token);

		if(user !=null) {
			user.setEmailVerified(true);
			user.setEnabled(true);
			userService.updateUser(user);
			return "/user/accountVerified";
		}

		return "/user/accountNotFound";
	}


}
