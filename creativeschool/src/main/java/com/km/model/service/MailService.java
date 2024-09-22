package com.km.model.service;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.km.model.dto.MailInfo;

@Service
public class MailService {
	
	@Autowired
	private JavaMailSender javaMailSender;
	
	
	public boolean sendMail(MailInfo mailInfo) {
		try {
			MimeMessage message=javaMailSender.createMimeMessage();
			MimeMessageHelper messageHelper
				=new MimeMessageHelper(message,"UTF-8");
			messageHelper.setTo(mailInfo.getReciever());
			messageHelper.setSubject(mailInfo.getTitle());
			messageHelper.setText(mailInfo.getContent(),true);
			
			javaMailSender.send(message);
			
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
}








