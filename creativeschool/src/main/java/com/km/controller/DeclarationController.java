package com.km.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/declaration")
public class DeclarationController {
	
	@RequestMapping("/requestdeclaration.km")
	public String reportinfo() {
		return "declaration/report
	}
}






