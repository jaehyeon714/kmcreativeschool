package com.km.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.km.model.dto.ChattingData;
import com.km.model.dto.Police;
import com.km.model.service.PoliceService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@SessionAttributes({"clientEmail"})
@Slf4j
public class ChatController {
	
	private final PoliceService service;
	private ObjectMapper mapper=new ObjectMapper();
	
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
	
	@RequestMapping("/chat/upload.km")
	@ResponseBody
	public ChattingData uploadfile(MultipartFile[] upfile,String sender, 
			String receiver, String chattingRoom,HttpSession session) {
		
		String realPath=session.getServletContext().getRealPath("/resources/upload/chatting");
		File dir=new File(realPath+"/"+chattingRoom);
		if(!dir.exists()) dir.mkdirs();
		List<String> fileNames=new ArrayList<>();
		if(upfile!=null) {
			Random randomObj=new Random();
			SimpleDateFormat formatDate=new SimpleDateFormat("yyyy_MM_dd_HHmmsssss");
			for(MultipartFile file : upfile) {
				String oriFileName=file.getOriginalFilename();
				String ext=oriFileName.substring(oriFileName.lastIndexOf("."));
				int rndNum=randomObj.nextInt(1000)+1;
				String reFileName="KM_chatting"+(formatDate.format(new Date()))+"_"+rndNum+ext;
				try {
					file.transferTo(new File(dir,reFileName));
					fileNames.add(reFileName);
				}catch(IOException e) {
					e.printStackTrace();
				}
			}
		}		
		
		ChattingData cd=ChattingData.builder()
				.sender(sender)
				.receiver(receiver)
				.chattingCategory("file")
				.chattingRoom(chattingRoom)
				.build();
		
		try {
			cd.setChattingContent(mapper.writeValueAsString(fileNames));
		}catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return cd;
	}
	
	@RequestMapping("/chat/download")
	public void download(String rename, String chattingRoom,
			OutputStream out, HttpSession session,
			HttpServletResponse response) {
		String path=session.getServletContext()
				.getRealPath("/resources/upload/chatting/"+chattingRoom+"/");
		File downloadFile=new File(path+rename);
		try(FileInputStream fis=new FileInputStream(downloadFile);
			BufferedInputStream bis=new BufferedInputStream(fis);
			BufferedOutputStream bos=new BufferedOutputStream(out);){
			
			response.setContentType("application/octet-stream;charset=utf-8");
			response.setHeader("Content-Disposition", "attachment;filename=\""+rename+"\"");
			
			int data=-1;
			
			while((data=bis.read())!=-1) {
				bos.write(data);
			}
			
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	
}
