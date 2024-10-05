package com.km.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

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
	public String liveChat(String sender, String receiver,Model m) {
		if(!receiver.contains("@")) {
			Police policeObj=service.selectPoliceById(receiver);
			m.addAttribute("policeObj", policeObj);		
		}
		m.addAttribute("clientEmail", receiver.contains("@")?receiver:sender);
		m.addAttribute("sender",sender);
		m.addAttribute("receiver",receiver);
		return "chat/livechat";
	}
	
	@RequestMapping("/chat/policechat.km")
	public String policeChat() {
		return "chat/livechat";
	}
	
}
