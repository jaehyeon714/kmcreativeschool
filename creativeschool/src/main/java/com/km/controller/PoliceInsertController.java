package com.km.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.km.model.dto.Police;
import com.km.model.dto.PoliceStation;
import com.km.model.service.DeclarationService;
import com.km.model.service.PoliceServicelmpl;

@Controller
public class PoliceInsertController {
	@Autowired
	private PoliceServicelmpl service;
	
	@RequestMapping("/police/policeinsert.km")
	public String policeinsert() {
		return "police/policeinsert";
	}
	
	@RequestMapping("/police/policeInsertDo.km")
	public String policeInsertDo(Police police, PoliceStation policeStation) {
		System.out.println(police);
		System.out.println(policeStation);
		service.insertPolice(police);
		return "police/policeinsert";
	}
	
	@RequestMapping(value = "/police/findIdPw", method = RequestMethod.POST)
	public String findByPw(String policeEmail, Model model) {
        List<Police> police = service.findIdPw(policeEmail);

        if (police == null) {
            model.addAttribute("error", "해당 이메일에 대한 경찰관을 찾을 수 없습니다.");
            return "redirect:/"; // 오류 페이지로 이동
        }
        police.forEach(p -> {
            System.out.println(p.getPoliceEmail().equals(policeEmail));
        });
        model.addAttribute("police", police);
        return "redirect:/police/findIdPw.do"; // 성공적으로 찾은 경우 홈으로 리다이렉트
    }
	
}
