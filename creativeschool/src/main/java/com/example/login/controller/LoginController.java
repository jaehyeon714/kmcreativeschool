package com.example.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

    @GetMapping("/login")
    public String showLoginPage() {
        return "login"; // login.jsp로 이동
    }

    @PostMapping("/login")
    public String login(@RequestParam("username") String username,
                        @RequestParam("password") String password,
                        Model model) {
        // 간단한 로그인 처리 (아이디/비밀번호 확인)
        if ("admin".equals(username) && "password".equals(password)) {
            return "welcome"; // 로그인 성공 시 이동할 페이지 (welcome.jsp)
        } else {
            model.addAttribute("error", "Invalid username or password");
            return "login"; // 실패 시 로그인 페이지로 다시 이동
        }
    }
    
    @GetMapping("policeenroll.do")
    public String policeLogin() {
        return "/police/policeenroll"; // policeenroll.jsp로 이동
    }
}
