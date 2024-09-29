package com.km.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.km.model.dto.Attacker;
import com.km.model.dto.DeclarationAttachment;
import com.km.model.dto.Police;
import com.km.model.dto.Report;
import com.km.model.dto.Reporter;

public interface DeclarationDao {

	int insertDeclaration(SqlSession session, Report report);
	
	List<Report> selectReportAll(SqlSession session, Map param);
	
	List<Report> selectReportSearch(SqlSession session,Map<String,String> mapKeyword);
	
	int insertReporter(SqlSession session, Reporter reporter);
	
	int insertAttacker(SqlSession session, Attacker attacker);
	
	int insertDeclarationAttachment(SqlSession session, DeclarationAttachment file);
	
	List<Police> searchReportAreaPolice(SqlSession session, String area);
	
}
