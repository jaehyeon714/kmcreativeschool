package com.km.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	@RequestMapping("/updatestatus.do")
	public String declarationUpdateStatus(int reportNo, int status) {
		//status 1 접수, 2 처리완료
		service
	}
	
}
