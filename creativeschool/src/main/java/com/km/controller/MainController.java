package com.km.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.km.model.service.DeclarationService;


@Controller
public class MainController {

	@Autowired
	private DeclarationService service;
	
	
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
	
	@RequestMapping("/declaration/updatestatus.do")
	public String declarationUpdateStatus(int reportNo, int status,
			Model m) {
		//status 1 접수, 2 처리완료
		int result=service.updatePoliceStatus(Map.of("reportNo",reportNo,
				"status",status==1?"접수":"완료"));
		
		m.addAttribute("msg",(result>0&&status==1?"접수처리 되었습니다."
				:"사건종료처리 되었습니다."));
		m.addAttribute("loc","/declaration/searchDeclarationdetail?no="+reportNo);
		return "common/msg";
	}
	
	@RequestMapping("/file/download")
	public void download(String div, String rename, String oriname, String chattingRoom,
			OutputStream out, HttpSession session,
			HttpServletResponse response) {
		String divPath="";
		switch(div) {
			case "chat":divPath="/chatting/"+chattingRoom+"/";break;
			case "report":divPath="/repoter/";
		}
		
		String path=session.getServletContext()
				.getRealPath("/resources/upload"+divPath);
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
