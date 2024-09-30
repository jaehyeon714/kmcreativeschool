package com.km.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.km.model.dto.Police;
import com.km.model.service.PoliceService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@SessionAttributes({"clientEmail"})
public class ChatController {
	
	private final PoliceService service;
	
	@RequestMapping("/chat/livechatlist.km")
	public String chatList(Model m) {
		List<Map> polices=service.selectPoliceAll();
		m.addAttribute("polices", polices);
		return "chat/chatlist";
	}
	
	@RequestMapping("/chat/livechat.km")
	public String liveChat(String police, String clientEmail,Model m) {
		Police policeObj=service.selectPoliceById(police);
		m.addAttribute("policeObj", policeObj);
		m.addAttribute("police",police);
		m.addAttribute("clientEmail",clientEmail);
		return "chat/livechat";
	}
	
	
	
}
