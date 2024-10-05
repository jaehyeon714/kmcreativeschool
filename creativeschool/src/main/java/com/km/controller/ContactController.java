package com.km.controller;

import com.km.model.dto.Contact;
import com.km.model.service.QnaService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
public class ContactController {
	
	private QnaService service;
	
	public ContactController(QnaService service) {
		this.service = service;
	}

    private List<Contact> contacts = new ArrayList<>(); // 문의를 저장할 리스트

    // 문의 목록 조회
    @GetMapping("/contact")
    public String showContactList(Model model) {
        List<Contact> contacts = service.selectAllBoard();
        System.out.println(contacts); // 콘솔에 확인
        model.addAttribute("contacts", contacts);
        return "contact/contact";
    }

    // 문의 상세 보기 (contactview.do)
    @GetMapping("/contact/contactview")
    public String showContactDetail(@RequestParam Number id_seq, Model model) {
        Optional<Contact> contact = contacts.stream()
                .filter(c -> c.getId_seq().equals(id_seq))
                .findFirst();

        model.addAttribute("contact", contact.orElse(null)); // ID로 문의 상세 조회
        return "contact/contactview"; // 상세 보기 페이지 반환
    }

    // 문의 작성 페이지로 이동
    @RequestMapping("/contactwrite.do")
    public String showContactWriteForm() {
        return "contact/contactwrite"; // 문의 작성 페이지 반환
    }

    // 문의 저장
    @PostMapping("/contact")
    public String saveContact(@RequestParam String title, 
                              @RequestParam String contactContent) {
        Contact contact = Contact.builder()
                .id_seq(contacts.size() + 1) // ID는 리스트의 크기를 기반으로 설정
                .title(title)
                .contactContent(contactContent)
                .dateTime(LocalDateTime.now())
                .build();
        contacts.add(contact); // 문의를 리스트에 저장
        return "redirect:/contact/contactview?id_seq=" + contact.getId_seq(); // 저장 후 상세보기로 리다이렉트
    }
}

