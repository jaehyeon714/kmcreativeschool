package com.km.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {
	
	@RequestMapping("/chat/livechatlist.km")
	public String chatList() {
		return "chat/chatlist";
	}
	
	@RequestMapping("/chat/livechatlist/livechat.km")
	public String liveChat() {
		return "chat/livechat";
	}
	
	
	
}
