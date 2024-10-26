package com.km.controller;

import java.security.SecureRandom;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.km.common.MailService;
import com.km.model.dto.MailInfo;
import com.km.model.dto.Police;
import com.km.model.service.PoliceServicelmpl;

@Controller
public class IdentityFindController {
	
    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    private static final int LENGTH = 10;
    
    public static String generateRandomString() {
        SecureRandom random = new SecureRandom();
        StringBuilder sb = new StringBuilder(LENGTH);
        
        for (int i = 0; i < LENGTH; i++) {
            int index = random.nextInt(CHARACTERS.length());
            sb.append(CHARACTERS.charAt(index));
        }
        
        return sb.toString();
    }

	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private MailService mailService;
	
	@Autowired
	private PoliceServicelmpl service;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@PostMapping("/police/findIdPw")
	public String findIdentity(@RequestParam("policeEmail") String email, @RequestParam("action") String action) {
		var police = service.selectPoliceByEmail(email);
		if (police == null) {
			return "/police/findIdPwFail";
		}
		System.out.println(email);
		var mailInfo = MailInfo.builder().reciever(email).title(police.getPoliceName() + " 회원님, 요청하신 로그인 정보 발송해드립니다.")
				.build();

		if (action.equals("findId")) {
			mailInfo.setContent("<h3>" + police.getPoliceName() + " 회원님의 아이디 정보입니다.</h3><br>" + "ID: "
					+ police.getPoliceIdentity() + "<br>" + "감사합니다.");
		}

		if (action.equals("findPw")) {
			var newPassword = generateRandomString();
			mailInfo.setContent("<h3>" + police.getPoliceName() + " 회원님의 임시 비밀번호 정보입니다.</h3><br>" + "PW: " + newPassword
					+ "<br>" + "로그인 완료 후 비밀번호 변경 권장드립니다. 감사합니다.");
			service.updatePolicePassword(email, passwordEncoder.encode(newPassword));
		}
		mailService.sendMail(mailInfo);

		return "/police/findIdPwComplete";
	}
	
	@RequestMapping("/police/chagepassword.do")
	public String chagePassword(String password,HttpSession session,Model m) {
		
		Police p=(Police)session.getAttribute("loginPolice");
		int result=service.updatePolicePassword(p.getPoliceEmail(), passwordEncoder.encode(password));
		m.addAttribute("msg",result>0?"비밀번호변경완료":"비밀번호변경실패");
		m.addAttribute("loc","/police/logout.do");
		
		return "common/msg";
	}
	
}
