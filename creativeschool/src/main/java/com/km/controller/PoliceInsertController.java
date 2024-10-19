package com.km.controller;

import java.io.File;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.km.common.PageFactory;
import com.km.model.dto.Police;
import com.km.model.dto.PoliceStation;
import com.km.model.service.DeclarationService;
import com.km.model.service.PoliceServicelmpl;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class PoliceInsertController {
	@Autowired
	private PoliceServicelmpl service;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private DeclarationService declarationService;
	
	@RequestMapping("/police/policeinsert.km")
	public String policeinsert() {
		return "police/policeinsert";
	}

	@RequestMapping("/police/policeInsertDo.km")
	public String policeInsertDo(Police police, PoliceStation policeStation, MultipartFile policePhoto,
			HttpSession session) {
		List<String> locationList = new ArrayList<>(Stream.of(policeStation.getPoliceStationAddress().split(" ")).toList());
		
		for (int i = 0; i < locationList.size(); i++) {
			var name = locationList.get(i);
			if (name.isBlank() || name.isEmpty()) {
				locationList.remove(i);
				i--;
			}
		}
		
		if (locationList.size() == 5) {
			policeStation.setPoliceStationSido(locationList.get(0) + " " + locationList.get(1));
			policeStation.setPoliceStationGungu(locationList.get(2));
			policeStation.setPoliceStationDong(locationList.get(3) + " " + locationList.get(4));
		}
		if (locationList.size() == 4) {
			policeStation.setPoliceStationSido(locationList.get(0));
			policeStation.setPoliceStationGungu(locationList.get(1));
			policeStation.setPoliceStationDong(locationList.get(2) + " " + locationList.get(3));
		}

		
		PoliceStation existingStation = service.selectPoliceStaionByName(policeStation.getPoliceStationName());
		
		if (existingStation != null) { // 만약 경찰서가 이미 있다면 그 경찰서의 번호를 경찰에게 부여
			police.setPoliceStationNo(existingStation.getPoliceStationNo());
		} 
		else { // 경찰서가 없다면, 경찰서도 새로 insert하고 그 경찰서의 번호를 가져와 경찰에게 부여
			service.insertPoliceStation(policeStation);
			police.setPoliceStationNo(
					service.selectPoliceStaionByName(policeStation.getPoliceStationName()).getPoliceStationNo());
		}


		if (policePhoto != null && !policePhoto.isEmpty()) {
			String path = session.getServletContext().getRealPath("/resources/upload/police/");
			String oriFileName = policePhoto.getOriginalFilename();
			String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
			int randomNumber = new Random().nextInt(1000) + 1;
			SimpleDateFormat formatDate = new SimpleDateFormat("yyyy_MM_dd_HHmmsssss");
			String newFileName = "KM_" + formatDate.format(new Date()) + "_" + randomNumber + ext;
			
			try {
				policePhoto.transferTo(new File(path, newFileName));
				police.setPoliceProfile(newFileName);
			} 
			catch (Exception e) {
				e.printStackTrace();
				return "common/error";
			}
		}

		
		// 경찰 등록
		// 경찰등록 전 비밀번호 암호화하기
		String encodePassword=passwordEncoder.encode(police.getPolicePassword());
		log.debug(encodePassword);
		police.setPolicePassword(encodePassword);
		service.insertPolice(police);
		return "police/policeenroll";

	}
	
//	@RequestMapping(value = "/police/findIdPw", method = RequestMethod.POST)
//	public String findByPw(String policeEmail, Model model) {
//        List<Police> police = service.findIdPw(policeEmail);
//
//        if (police == null) {
//            model.addAttribute("error", "해당 이메일에 대한 경찰관을 찾을 수 없습니다.");
//            return "redirect:/"; // 오류 페이지로 이동
//        }
//        police.forEach(p -> {
//            System.out.println(p.getPoliceEmail().equals(policeEmail));
//        });
//        model.addAttribute("police", police);
//        return "redirect:/police/findIdPw.do"; // 성공적으로 찾은 경우 홈으로 리다이렉트
//    }
	

	@RequestMapping("/declaration/searchDeclaration.do")
	public String searchDeclaration(
			@RequestParam(defaultValue = "1") int cPage,
			@RequestParam(defaultValue = "5") int numPerpage,
			@SessionAttribute Police loginPolice,
			Model m) {
		
		List<Map> reports=declarationService
				.selectReportAll(Map.of(
						"policeId",loginPolice.getPoliceIdentity(),
						"cPage",cPage,
						"numPerpage",numPerpage));
		
		List<Map> searchStatusCount=service.selectDeclarationCount(Map.of("policeId",loginPolice.getPoliceIdentity()));
		Map<String,BigDecimal> statusCount=searchStatusCount.stream().collect(
				Collectors.toMap(
							k->(String)(k.get("DECLARATION_STATUS")==null?"미처리":k.get("DECLARATION_STATUS")),
							v->(BigDecimal)v.get("COUNT"))
				);
		
		long reportCount=declarationService.selectReportAllCount(loginPolice.getPoliceIdentity());
		m.addAttribute("reports",reports);
		m.addAttribute("pageBar",PageFactory.getPage(cPage, numPerpage, reportCount,"searchDeclaration.do"));
		m.addAttribute("statusCount",statusCount);
		
		log.debug("{}",reports);
		
		return "declaration/policeReport";
	}
	
	@RequestMapping("/declaration/searchdeclarationbyparam.do")
	public String searchDeclarationByParam(@RequestParam Map param,
			@RequestParam(defaultValue = "1") int cPage,
			@RequestParam(defaultValue = "5") int numPerpage,
			@SessionAttribute Police loginPolice,
			Model m) {
		param.put("cPage", cPage);
		param.put("numPerpage", numPerpage);
		param.put("policeId",loginPolice.getPoliceIdentity());
		
		List<Map> searchStatusCount=service.selectDeclarationCount(Map.of("policeId",loginPolice.getPoliceIdentity()));
		
		
		List<Map> reports=service.selectReportSearch(param);
		long reportCount=service.selectReportByParamCount(param);
		
		m.addAttribute("reports",reports);
		m.addAttribute("pageBar",PageFactory.getPageSearch(cPage, numPerpage, reportCount,"searchdeclarationbyparam.do",param));
		m.addAttribute("statusCount",getGroupStatusCount(searchStatusCount));
				
		return "declaration/policeReport";
	}
	
	private Map<String,BigDecimal> getGroupStatusCount(List<Map> searchStatusCount){
		return searchStatusCount.stream().collect(
				Collectors.toMap(
						k->(String)(k.get("DECLARATION_STATUS")==null?"미처리":k.get("DECLARATION_STATUS")),
						v->(BigDecimal)v.get("COUNT"))
			);
	}
	
}
