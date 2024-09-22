package com.km.config;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class KmConfig {
	
	@Bean
	JavaMailSender javaMailSender() {
		Properties mailData=new Properties();
		mailData.put("mail.smtp.auth", "true");
        mailData.put("mail.smtp.starttls.enable", "true");
        mailData.put("mail.smtp.host", "smtp.gmail.com");
        mailData.put("mail.smtp.port", "587");
        mailData.put("mail.debug", "true");
		
		JavaMailSenderImpl sender=new JavaMailSenderImpl();
		sender.setUsername("teacherdev09@gmail.com");
		sender.setPassword("ibgzqktxlpvkmlhb");
		sender.setJavaMailProperties(mailData);
		
		return sender;
	}
}





