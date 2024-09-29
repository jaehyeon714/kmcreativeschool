package com.km.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.km.model.dao.DeclarationDao;
import com.km.model.dto.Attacker;
import com.km.model.dto.Report;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DeclarationServiceImpl implements DeclarationService {
	
	private final SqlSession session;
	private final DeclarationDao dao;
	
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
				int attackerResult=dao.insertAttacker(session, a);
				if(attackerResult==0) throw new IllegalArgumentException("가해자 저장실패.");
			});
		}
		
		return 1;
	}

	@Override
	public List<Report> selectReportAll(Map param) {
		return null;
	}

	@Override
	public List<Report> selectReportSearch(Map<String,String> mapKeyword) {
		return null;
	}

	@Override
	public boolean reportSendPolice(Report report) {
		//메일 전송하기 
		//경찰관 email찾기
		
		
		//메세지 작성하기
		
		//이메일 전송하기
		
		return false;
	}
	
	
	
}
