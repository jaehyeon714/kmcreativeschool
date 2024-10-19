package com.km.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.km.model.dto.Police;
import com.km.model.service.PoliceService;

@Controller
public class LoginController {

	@Autowired
	private PoliceService service;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
    // 임의의 사용자 데이터 (예: 데이터베이스에서 가져온 사용자)
    private static final String VALID_USERNAME = "user";
    private static final String VALID_PASSWORD = "password";

    @GetMapping("/login")
    public String loginPage() {
        return "policeenroll"; // login.jsp 파일을 반환
    }

    @PostMapping("/login")
    public String login(String username, String password, Model model) {
        // 로그인 체크
        if (VALID_USERNAME.equals(username) && VALID_PASSWORD.equals(password)) {
            return "redirect:/"; // 로그인 성공 시 리다이렉트할 페이지
        } else {
            model.addAttribute("error", "아이디 또는 비밀번호가 잘못되었습니다.");
            return "login"; // 로그인 실패 시 다시 로그인 페이지로
        }
    }
    
    @GetMapping("policeenroll.do")
    public String policeLogin() {
        return "/police/policeenroll"; // policeenroll.jsp로 이동
    }
    
    @RequestMapping("/policeLogin.do")
    public String pLogin(String policeIdentity, String policePassword, HttpSession session) {
    	Police s = service.selectPoliceById(policeIdentity);
    	if(s!=null
    			&&passwordEncoder.matches(policePassword,s.getPolicePassword())) {
    		//로그인 성공
    		System.out.println("경찰 로그인 성공");
    		//log기록하기
    		service.updatePoliceLog(Map.of("flag","in","id",s.getPoliceIdentity()));
    		session.setAttribute("loginPolice", s);
    		session.setMaxInactiveInterval(60*3);//유휴로그인 유지시간 3분
    		
    	}else {
    		//로그인 실패
    		System.out.println("경찰 로그인 실패");
    	}
    	
    	return "redirect:/";
    }
    
    @RequestMapping("/police/logout.do")
    public String logout(HttpSession session) {
    	Police s=(Police)session.getAttribute("loginPolice");
    	if(s!=null) {
	    	service.updatePoliceLog(Map.of("flag","out","id",s.getPoliceIdentity()));
	    	session.invalidate();
    	}
    	return "redirect:/";
    }
    
    
    
    
    
}
