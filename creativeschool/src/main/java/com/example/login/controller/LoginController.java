package com.example.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {

    // 임의의 사용자 데이터 (예: 데이터베이스에서 가져온 사용자)
    private static final String VALID_USERNAME = "user";
    private static final String VALID_PASSWORD = "password";

    @GetMapping("/login")
    public String loginPage() {
        return "login"; // login.jsp 파일을 반환
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
    
    
    
}
