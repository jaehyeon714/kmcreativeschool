package com.km.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.km.common.CommonUtils;
import com.km.common.MailService;
import com.km.model.dao.DeclarationDao;
import com.km.model.dto.MailInfo;
import com.km.model.dto.Report;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import oracle.sql.CLOB;

@Service
@RequiredArgsConstructor
@Slf4j
public class DeclarationServiceImpl implements DeclarationService {
	
	private final SqlSession session;
	private final DeclarationDao dao;
	private final MailService mailService;
	@Override
	@Transactional
	public int insertDeclaration(Report report) {
		
		int result=dao.insertReporter(session, report.getReporter());
		
		if(result==0) throw new IllegalArgumentException("신고자");
		
		result=dao.insertDeclaration(session, report);
		
		if(result==0) throw new IllegalArgumentException("신고내용");
		
		if(report.getFiles().size()>0) {
			report.getFiles().forEach(file->{
				file.setDeclarationNo(report.getReportNo());
				int attachResult=dao.insertDeclarationAttachment(session, file);
				if(attachResult==0) throw new IllegalArgumentException("파일");
			});
		}
		
		if(report.getAttackers().size()>0) {
			report.getAttackers().forEach(a->{
				a.setDeclarationNo(report.getReportNo());
				int attackerResult=dao.insertAttacker(session, a);
				if(attackerResult==0) throw new IllegalArgumentException("가해자 저장실패.");
			});
		}
		
		return 1;
	}

	@Override
	public List<Map> selectReportAll(Map param) {
		return dao.selectReportAll(session, param);
	}

	@Override
	public List<Map> selectReportSearch(Map<String,Object> mapKeyword) {
		return dao.selectReportSearch(session, mapKeyword);
	}

	@Override
	public boolean reportSendPolice(Report report,String url) {
		List<Map> result=dao.searchReportAreaPolice(session, 
				Map.of("sido",report.getSido(),"gungu",report.getGungu(),
						"dong",report.getDong().split(" ")[0]));
		
		
		if(result.size()>0) {
			//경찰관 사건지정하기
			//첫번째로 나오는 경찰에게 사건연결
			//차후 변경할 수 있게 설정
			dao.insertJoinReport(session,Map.of("reportNo",
					report.getReportNo(),"policeNo",result.get(0).get("POLICE_NO")));

			//메일 전송하기 
			//경찰관 email찾기
			String content="""
					<h2>%s에서 학교폭력이 접수되었습니다.<h2>
					<h3>접수자 : %s Email : %s</h3>
					<h4><a href="%s">학교폭력신고사이트 바로가기</a></h4>
					""".formatted(report.getIncidentAddress(),
							report.getReporter().getReporterName(),
							report.getReporter().getReporterEmail(),
							CommonUtils.SITE_HOST+"");
			//메세지 작성하기
			MailInfo mail=MailInfo.builder()
					.title("학교폭력 사건이 접수되었습니다")
					.content(content)
					.build();
			
			result.stream().forEach(police->{
				mail.setReciever((String)police.get("POLICE_EMAIL"));
				//이메일 전송하기
				mailService.sendMail(mail);
			});
			return true;
		}
		return false;
	}

	@Override
	public long selectReportAllCount(String id) {
		// TODO Auto-generated method stub
		return dao.selectReportAllCount(session, id);
	}

	@Override
	public Report selectReportByNo(long no) {
		// TODO Auto-generated method stub
		return dao.selectReportByNo(session,no);
	}
	
	@Override
	public int updatePoliceStatus(Map param) {
		
		int result=dao.updatePoliceStatus(session, param);
		if(result>0) {
			//신고자에게 메일전송하기
			Map info=dao.searchReporterByReportNo(session,(int)param.get("reportNo"));
			String infoContent="";
			try {
				infoContent=((CLOB)info.get("DECLARATION_CONTENT")).stringValue();
			}catch (Exception e) {}
			String content="""
					<h2>%s님이 접수한 '%s'사건이 <span style="color:%s">%s</span>되었습니다.<h2>
					<h3>처리자 : %s Email : %s</h3>
					<h4><a href="%s">학교폭력신고사이트 바로가기</a></h4>
					""".formatted(info.get("REPORTER_EMAIL"),
								infoContent,
							((String)param.get("status")).equals("접수")?
									"#28a745":"#17a2b8",
							(String)param.get("status"),
							info.get("POLICE_NAME"),
							info.get("POLICE_EMAIL"),
							CommonUtils.SITE_HOST+"");
			//메세지 작성하기
			MailInfo mail=MailInfo.builder()
					.title("학교폭력 사건이 "+(String)param.get("status")+"처리 되었습니다")
					.content(content)
					.reciever((String)info.get("REPORTER_EMAIL"))
					.build();
			
			boolean mailResult=mailService.sendMail(mail);
			if(!mailResult) {
				log.error("사건처리 이메일 전송실패!");
			}
		}
		return result; 
	}

	@Override
	public List<Map<String, Object>> selectReportsByEmailAndPassword(String email, String password) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("password", password);
		return dao.selectReportsByEmailAndPassword(session, map);
	}
	
	

	
}
