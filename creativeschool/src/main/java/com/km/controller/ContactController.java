package com.km.controller;

import com.km.model.dto.Contact;
import com.km.model.service.QnaService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ContactController {
	
	@Autowired
	private QnaService qnaService;

    private List<Contact> contacts = new ArrayList<>(); // 문의를 저장할 리스트

    // 문의 목록 조회
    @GetMapping("/contact")
    public String showContactList(Model model) {
    	List<Contact> contacts = qnaService.selectAllBoard();
        model.addAttribute("contacts", contacts);
        return "contact/contact";
    }

    // 문의 상세 보기 (contactview.do)
    @GetMapping("/contact/contactview")
    public String showContactDetail(@RequestParam(name = "seq") int seq, Model model) {
        // seq가 유효한지 확인
        if (seq <= 0) {
            throw new IllegalArgumentException("Invalid sequence number.");
        }

        Contact contact = qnaService.findByIdSeq(seq);
        model.addAttribute("contact", contact);
        return "contact/contactview";
    }


    // 문의 작성 페이지로 이동
    @RequestMapping(value = "/contact/contactwrite.do", method = RequestMethod.GET)
    public String showContactWriteForm() {
        return "contact/contactwrite"; // 문의 작성 페이지 반환
    }

    // 문의 저장
    /* @PostMapping("/contactwriteForm")
    public String saveContact(@RequestParam String title, 
                              @RequestParam String contactContent) {
        Contact contact = Contact.builder()
                .seq((contacts.size() + 1)) // ID는 리스트의 크기를 기반으로 설정
                .title(title)
                .contactContent(contactContent)
                .dateTime(null)
                .build();
        contacts.add(contact); // 문의를 리스트에 저장
        return "redirect:/contact/contactview?seq=" + contact.getSeq(); // 저장 후 상세보기로 리다이렉트
	} */
    
    @PostMapping("/contact/contactwrite.submit")
    public String insertContact(
    		@RequestParam String writer,
    		@RequestParam String title,
    		@RequestParam String contactContent) {
    	qnaService.insertContact(writer, title, contactContent);
    	return "redirect:/contactview";
    }
    
    
}

