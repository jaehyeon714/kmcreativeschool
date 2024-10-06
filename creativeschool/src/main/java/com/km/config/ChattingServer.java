package com.km.config;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.km.model.dto.ChattingData;
import com.km.model.service.ChattingService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
public class ChattingServer extends TextWebSocketHandler {
	@Autowired
	private ChattingService chattingService;
	
	private Map<String,WebSocketSession> clients=new HashMap<>();
	//DB저장전 데이터를 임시 보관
	// 데이터가 100가 되면 DB에 일괄저장 후 초기화
	private List<ChattingData> cacheData=new ArrayList<>();
	
	private ObjectMapper mapper=new ObjectMapper();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
//		log.debug("{}",session);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		ChattingData msg=mapper.readValue(message.getPayload(), ChattingData.class);
		log.debug("{}",msg);
		session.getAttributes().put("content",msg);
		switch(msg.getChattingCategory()) {
			case "open" : addClient(msg,session); break;
			case "msg": case "enter" : case "file" : sendMessage(msg); break;
			case "request" : request(msg);break;
		}
	}


	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
//		log.debug("{}",clients);
		List<String> key=clients.keySet().stream()
			.filter(k->Objects.equals(clients.get(k),session)).toList();
//		log.debug("{}",key);
		for(String k : key) {
			clients.remove(k);
		}
	}
	private void request(ChattingData msg) {
		WebSocketSession target=clients.get(msg.getReceiver());
		try {
			log.debug("{}",target);
			if(target!=null) {
				log.debug("session확인{}",target.isOpen());
				target.sendMessage(new TextMessage(mapper.writeValueAsString(msg)));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	private void sendMessage(ChattingData msg) {
		//같은 방에 있는 클라이언트 찾기 
		List<WebSocketSession> client=clients.values().stream()
		.filter(s->{
			ChattingData cd=(ChattingData)s.getAttributes().get("content");
			return cd.getChattingRoom()!=null
					&&cd.getChattingRoom().equals(msg.getChattingRoom());
		}).toList();
		
		//클라이언트에게 메세지 보내기 
		client.stream().forEach(s->{
			try {
				s.sendMessage(new TextMessage(mapper.writeValueAsString(msg)));
			}catch(IOException e) {
				e.printStackTrace();
			}
		});
		
	}
	
	private void addClient(ChattingData msg,WebSocketSession session) {
		clients.put(msg.getSender(), session);
		log.debug("{}",clients);
	}
}
