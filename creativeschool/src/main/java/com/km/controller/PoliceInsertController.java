package com.km.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PoliceInsertController {
		
	@RequestMapping("/police/policeinsert.km")
	public String policeinsert() {
		return "police/policeinsert";
		
	}
		
}
