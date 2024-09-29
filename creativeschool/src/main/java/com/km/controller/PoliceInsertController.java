package com.km.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.km.model.dto.Police;
import com.km.model.dto.PoliceStation;
import com.km.model.service.DeclarationService;
import com.km.model.service.PoliceServicelmpl;

@Controller
public class PoliceInsertController {
	@Autowired
	private PoliceServicelmpl service;
	
	@RequestMapping("/police/policeinsert.km")
	public String policeinsert() {
		return "police/policeinsert";
	}
	
	@RequestMapping("/police/policeInsertDo.km")
	public String policeInsertDo(Police police, PoliceStation policeStation) {
		System.out.println(police);
		System.out.println(policeStation);
		service.insertPolice(police);
		return "police/policeinsert";
		
		
	}
		
}
