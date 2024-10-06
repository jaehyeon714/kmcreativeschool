package com.km.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.km.model.dto.Attacker;
import com.km.model.dto.DeclarationAttachment;
import com.km.model.dto.Report;
import com.km.model.dto.Reporter;

public interface DeclarationDao {

	int insertDeclaration(SqlSession session, Report report);
	
	List<Map> selectReportAll(SqlSession session, Map param);
	
	List<Map> selectReportSearch(SqlSession session,Map<String,Object> mapKeyword);
	
	int insertReporter(SqlSession session, Reporter reporter);
	
	int insertAttacker(SqlSession session, Attacker attacker);
	
	int insertDeclarationAttachment(SqlSession session, DeclarationAttachment file);
	
	List<Map> searchReportAreaPolice(SqlSession session, Map area);
	
	int insertJoinReport(SqlSession session, Map data);
	
	long selectReportAllCount(SqlSession session,String id);
	
	Report selectReportByNo(SqlSession session, long no);
}
