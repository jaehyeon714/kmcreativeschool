package com.km.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.km.model.service.PoliceService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ChatController {
	
	private final PoliceService service;
	
	@RequestMapping("/chat/livechatlist.km")
	public String chatList(Model m) {
		List<Map> polices=service.selectPoliceAll();
		m.addAttribute("polices", polices);
		return "chat/chatlist";
	}
	
	@RequestMapping("/chat/livechatlist/livechat.km")
	public String liveChat() {
		return "chat/livechat";
	}
	
	
	
}
