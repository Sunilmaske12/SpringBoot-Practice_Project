package com.sunil.SCM2.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender javaMailSender;

    public void sendMail(String to, String subject, String body) {
       try {
           SimpleMailMessage mail = new SimpleMailMessage();
           mail.setSubject(subject);
           mail.setTo(to);
           mail.setText(body);
           javaMailSender.send(mail);
       } catch (Exception e) {
           e.printStackTrace();
       }
    }

    public String getEmailVerificationLink(String emailToken) {
        return "http://localhost:8080/auth/verify-email?token="+emailToken;
    }
}
