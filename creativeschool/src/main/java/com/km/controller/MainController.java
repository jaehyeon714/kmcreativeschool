package com.km.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {
	
	@RequestMapping("/")
	public String main() {
		return "index";
	}
	
	@RequestMapping("/police/policeenroll.do")
	public String policeLogin() {
		return "police/policeenroll";
	}
	
	@RequestMapping("/contact.do")
	public String contact() {
		return "contact/contact";
	}
	
	@RequestMapping("/contact/contactview.do")
	public String contactView() {
		return "contact/contactview";
	}
	
	@RequestMapping("/contact/contactwrite.do")
	public String contactWrite() {
		return "contact/contactwrite";
	}
	
}
