package com.km.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.km.model.dto.Attacker;
import com.km.model.dto.Reporter;

@Controller
@RequestMapping("/declaration")
public class DeclarationController {
	
	@RequestMapping("/requestdeclaration.km")
	public String reportinfo() {
		//신고자정보 등록화면
		return "report/reporter";
	}
	@RequestMapping("/reportenroll.km")
	public String enrollReport(Reporter reporter) {
		System.out.println(reporter);
		return "report/report";
	}
	@RequestMapping("/reportenrollend.km")
	public String enrollEndReport(@RequestParam List<Attacker> attacker) {
		
		return "";
	}
}




