package com.km.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
}
