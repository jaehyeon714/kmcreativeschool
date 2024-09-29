package com.km.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/police")
public class PoliceInsertController {
		
	@RequestMapping("/policeinsert.do")
	public String policeinsert() {
		return "police/policeinsert";
		
	}
		
}
