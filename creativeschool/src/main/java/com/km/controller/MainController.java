package com.km.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

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
	
	@RequestMapping("/police/findIdPw.do")
	public String policeFindIdPw() {
		return "police/findIdPw";
	}
}
