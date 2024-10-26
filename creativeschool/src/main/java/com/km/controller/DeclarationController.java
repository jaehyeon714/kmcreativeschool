package com.km.controller;

import java.io.File;
import java.sql.Clob;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.km.common.CommonUtils;
import com.km.common.PageFactory;
import com.km.model.dto.DeclarationAttachment;
import com.km.model.dto.Police;
import com.km.model.dto.Report;
import com.km.model.dto.Reporter;
import com.km.model.service.DeclarationService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/declaration")
@SessionAttributes({ "reporter" })
@Slf4j
public class DeclarationController {
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private DeclarationService service;
	

	@RequestMapping("/requestdeclaration.km")
	public String reportinfo() {
		// 신고자정보 등록화면
		return "report/reporter";
	}

	@RequestMapping("/reportenroll.km")
	public String enrollReport(Reporter reporter, Model m) {
		m.addAttribute("reporter", reporter);
		return "report/report";
	}

	@RequestMapping("/reportenrollend.km")
	public String enrollEndReport(Report report, MultipartFile[] upfile, HttpSession session,
			HttpServletRequest request, Model m) {
		// 파일저장하기
		if (upfile != null) {
			String path = session.getServletContext().getRealPath("/resources/upload/repoter/");
			Random randomObj = new Random();
			SimpleDateFormat formatDate = new SimpleDateFormat("yyyy_MM_dd_HHmmsssss");
			for (MultipartFile file : upfile) {
				if (!file.isEmpty()) {
					String oriFileName = file.getOriginalFilename();
					String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
					int rndNum = randomObj.nextInt(1000) + 1;
					String reFileName = "KM_" + (formatDate.format(new Date())) + "_" + rndNum + ext;
					try {
						file.transferTo(new File(path, reFileName));
						DeclarationAttachment da = DeclarationAttachment.builder()
								.declarationAttachmentRename(reFileName).declarationAttachmentOriginalName(oriFileName)
								.build();
						report.getFiles().add(da);
					} 
					catch (Exception e) {

						e.printStackTrace();

						if (report.getFiles().size() > 0) {
							File[] allFile = new File(path).listFiles((dir, name) -> {
								for (DeclarationAttachment d : report.getFiles()) {
									return name.equals(d.getDeclarationAttachmentRename());
								}
								return false;
							});

							Arrays.stream(allFile).forEach(f -> f.delete());
						}
						return "common/error";
					}
				}
			}
		}
		
		// 신고자 저장하기
		Reporter reporter = (Reporter) session.getAttribute("reporter");
		reporter.setReporterPassword(passwordEncoder.encode(reporter.getReporterPassword()));
		report.setReporter(reporter);
		// 주소 분할해서 저장하기
		String[] addr = report.getIncidentAddress().split(" ");
		String searchArea = "";
		if (addr.length == 5) {
			report.setSido(addr[0] + " " + addr[1]);
			report.setGungu(addr[2]);
			report.setDong(addr[3] + " " + addr[4]);
			searchArea = addr[2] + " " + addr[3];
		} 
		else {
			report.setSido(addr[0]);
			report.setGungu(addr[1]);
			report.setDong(addr[2] + " " + addr[3]);
		}
		log.debug(request.getContextPath());
		try {
			// DB에 데이터 저장
			service.insertDeclaration(report);
			// 신고 관할서 경찰관에게 메일 전송하기
			boolean flag = service.reportSendPolice(report, CommonUtils.SITE_HOST + request.getContextPath());
			log.debug("{}",flag);
			m.addAttribute("msg", "정상적으로 신고 처리 되었습니다");
			m.addAttribute("status", "light");

		} 
		catch (IllegalArgumentException e) {

			m.addAttribute("msg", e.getMessage() + "을(를) 실패했습니다 다시 시도하거나 관리자에게 문의하세요.");
			m.addAttribute("status", "danager");
		}
		session.removeAttribute("reporter");
		return "common/msg";

	}

//	@RequestMapping("/searchDeclaration.do")
	public String searchDeclaration(@RequestParam(defaultValue = "1") int cPage,
			@RequestParam(defaultValue = "5") int numPerpage, @SessionAttribute Police loginPolice, Model m) {

		List<Map> reports = service.selectReportAll(
				Map.of("policeId", loginPolice.getPoliceIdentity(), "cPage", cPage, "numPerpage", numPerpage));
		long reportCount = service.selectReportAllCount(loginPolice.getPoliceIdentity());
		m.addAttribute("reports", reports);
		m.addAttribute("pageBar", PageFactory.getPage(cPage, numPerpage, reportCount, "searchDeclaration.do"));
		log.debug("{}", reports);

		return "declaration/policeReport";
	}

	@RequestMapping("/searchDeclarationdetail")
	public String declarationDetail(long no, Model m) {
		Report report = service.selectReportByNo(no);
		log.debug("{}", report);
		m.addAttribute("report", report);

		return "declaration/reportDetail";
	}

//	@RequestMapping("/updatestatus.do")
//	public String updateStatus(String status, String id) {
//			if (status.equals("1")) {
//				String result = service.updateStatus(id, "접수");
//				System.out.println("접수");
//				
//			} else if(status.equals("2")){
//				String result = service.updateStatus(id, "처리완료");
//				System.out.println("처리완료");
//				
//			} else {
//				System.out.println("어케하노 하하호호");
//			}
//		
//		return "declaration/reportDetail";
//	}
	
	//====================이메일로 신고자 정보 가져오기============
	
	@RequestMapping("/getReporterInfoByEmail.km")
	public ResponseEntity<Reporter> getReporterInfoByEmail(@RequestParam String email) {
		System.out.println(email);
		Reporter reporterInfo = service.selectReporterByEmail(email);
        System.out.println(reporterInfo);
        return ResponseEntity.status(HttpStatus.OK).body(reporterInfo);
	}
	
	
	//======================================================

	@RequestMapping("/userReportLogin.km") // 로그인
	public String userReportLoginView(HttpSession session) {
		session.invalidate();
		return "declaration/userReportListLogin";
	}

	@RequestMapping("/userReportLogin.do")
	public String userReportLoginDo(HttpSession session, String id, String pw) {
		session.setAttribute("reporterId", id);
		session.setAttribute("reporterPw", passwordEncoder.encode(pw));

		List<Map<String, Object>> reportList = service.selectReportsByEmailAndPassword(id, pw);

		if (reportList.isEmpty()) {
			session.invalidate();
			return "redirect:/";
		}

		return "redirect:/declaration/userReportList.do";
	}

	@RequestMapping("/userReportList.do")
	public String userReportList(HttpSession session, @RequestParam(defaultValue = "1") int cPage,
			@RequestParam(defaultValue = "5") int numPerPage,
			@RequestParam(value = "condition", required = false) String condition,
			@RequestParam(value = "keyword", required = false) String keyword, Model model) {

		String reporterId = (String) session.getAttribute("reporterId");
		String reporterPw = (String) session.getAttribute("reporterPw");

		if (reporterId == null) {
			return "redirect:/userReportLogin.km";
		}

		List<Map<String, Object>> reportList = service.selectReportsByEmailAndPassword(reporterId, reporterPw);

		int completedReportCnt = 0;
		int submittedReportCnt = 0;
		int notSubmittedReportCnt = 0;

		if (keyword != null && !keyword.isEmpty() && condition != null) {
			Iterator<Map<String, Object>> iterator = reportList.iterator();
			while (iterator.hasNext()) {
				Map<String, Object> report = iterator.next();
				String status = (String) report.getOrDefault("DECLARATION_STATUS", "미접수");

				switch (status) {
				case "완료" -> completedReportCnt++;
				case "접수" -> submittedReportCnt++;
				default -> notSubmittedReportCnt++;
				}

				switch (condition) {
				case "내용":
					if (!CommonUtils.clobToString((Clob) report.get("DECLARATION_CONTENT")).contains(keyword)) {
						iterator.remove();
					}
					break;
				case "종류":
					if (!report.getOrDefault("DECLARATION_CATEGORY", "").toString().contains(keyword)) {
						iterator.remove();
					}
					break;
				case "상태":
					if (!status.equals(keyword)) {
						iterator.remove();
					}
					break;
				case "경찰관":
					if (!report.getOrDefault("POLICE_NAME", "").toString().contains(keyword)) {
						iterator.remove();
					}
					break;
				default:
					break;
				}
			}
		} else {
			for (var report : reportList) {
				String status = (String) report.getOrDefault("DECLARATION_STATUS", "미접수");
				switch (status) {
				case "완료" -> completedReportCnt++;
				case "접수" -> submittedReportCnt++;
				default -> notSubmittedReportCnt++;
				}
			}
		}

		long totalCount = reportList.size();
		List<Map<String, Object>> paginatedReports = reportList.stream().skip((long) (cPage - 1) * numPerPage)
				.limit(numPerPage).toList();

		model.addAttribute("reports", paginatedReports);
		model.addAttribute("completedReportCnt", completedReportCnt);
		model.addAttribute("submittedReportCnt", submittedReportCnt);
		model.addAttribute("notSubmittedReportCnt", notSubmittedReportCnt);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		model.addAttribute("pageBar",
				PageFactory.getPage(cPage, numPerPage, totalCount, "userReportList.do", condition, keyword));

		return "declaration/userReportList";
	}

}
