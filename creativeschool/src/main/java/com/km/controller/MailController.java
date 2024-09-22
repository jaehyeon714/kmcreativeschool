package com.km.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.km.model.dto.MailInfo;
import com.km.model.service.MailService;

@Controller
public class MailController {
	
	@Autowired
	private MailService mailService;
	
	@RequestMapping("/mail/test")
	@ResponseBody
	public boolean testSendMail() {
		return mailService.sendMail(MailInfo.builder().
				reciever("prince0324@naver.com")
				.title("테스트메일발송")
				.content("<h3>테스트내용</h3>")
				.build()
				);	
		//return "테스트메일발송";
	}
}





