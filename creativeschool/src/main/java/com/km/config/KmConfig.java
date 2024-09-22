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
		mailData.put("host", "smtp.gmail.com");
		mailData.put("port", "587");
		mailData.put("username", "teacherdev09");
		mailData.put("password", "ibgzqktxlpvkmlhb");
		mailData.put("mail.smtp.auth", true);
		mailData.put("mail.smtp.starttls", true);
		JavaMailSenderImpl sender=new JavaMailSenderImpl();
		sender.setJavaMailProperties(mailData);
		
		return sender;
	}
}





