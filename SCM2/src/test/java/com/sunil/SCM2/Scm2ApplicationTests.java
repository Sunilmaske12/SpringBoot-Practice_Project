package com.sunil.SCM2;

import com.sunil.SCM2.services.EmailService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class Scm2ApplicationTests {

	@Autowired
	private EmailService emailService;

	@Test
	void contextLoads() {
	}

	@Test
	void sendMail() {
		emailService.sendMail("test@gmail.com", "Testing API", "This is just testing");
	}

}
