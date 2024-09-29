package com.km.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/contact")
public class ContactController {
	
	@RequestMapping
	public String contact() {
		LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy년 M월 dd일 h시 mm분 ss초");
        System.out.println(now.format(formatter));
		return "contact/contact";
	}
	
	@RequestMapping("/contactview")
	public String contactView() {
		return "contact/contactview";
	}
	
	@RequestMapping("/contactwrite.do")
	public String contactWrite() {
		return "contact/contactwrite";
	}
	
	
	
}
