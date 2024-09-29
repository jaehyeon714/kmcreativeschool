package com.km.controller;

import com.km.model.dto.Contact;
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
@RequestMapping("/contact")
public class ContactController {

    private List<Contact> contacts = new ArrayList<>(); // 문의를 저장할 리스트

    // 문의 목록 조회
    @GetMapping("/contactList")
    public String showContactList(Model model) {
        model.addAttribute("contacts", contacts); // 저장된 문의 리스트를 모델에 추가
        return "contact/contact"; // 문의 리스트 페이지 반환
    }

    // 문의 상세 보기 (contactview.do)
    @GetMapping("/contactview")
    public String showContactDetail(@RequestParam Number id_seq, Model model) {
        Optional<Contact> contact = contacts.stream()
                .filter(c -> c.getId_seq().equals(id_seq))
                .findFirst();

        model.addAttribute("contact", contact.orElse(null)); // ID로 문의 상세 조회
        return "contact/contactview"; // 상세 보기 페이지 반환
    }

    // 문의 작성 페이지로 이동
    @GetMapping("/contactwrite")
    public String showContactWriteForm() {
        return "contact/contactWrite"; // 문의 작성 페이지 반환
    }

    // 문의 저장
    @PostMapping("/contactwrite.form")
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
