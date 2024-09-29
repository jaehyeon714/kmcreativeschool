package com.km.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.km.model.dto.Attacker;
import com.km.model.dto.DeclarationAttachment;
import com.km.model.dto.Police;
import com.km.model.dto.Report;
import com.km.model.dto.Reporter;

@Repository
public class DeclaraionDaoImpl implements DeclarationDao {

	@Override
	public int insertDeclaration(SqlSession session, Report report) {
		return session.insert("declaration.insertDeclaration",report);
	}

	@Override
	public List<Report> selectReportAll(SqlSession session, Map param) {
		return null;
	}

	@Override
	public List<Report> selectReportSearch(SqlSession session, Map<String, String> mapKeyword) {
		return null;
	}

	@Override
	public int insertReporter(SqlSession session, Reporter reporter) {
		return session.insert("declaration.insertReporter",reporter);
	}

	@Override
	public int insertAttacker(SqlSession session, Attacker attacker) {
		return session.insert("declaration.insertAttacker",attacker);
	}

	@Override
	public int insertDeclarationAttachment(SqlSession session, DeclarationAttachment file) {
		return session.insert("declaration.insertAttachment",file);
	}

	@Override
	public List<Police> searchReportAreaPolice(SqlSession session, String area) {
		return session.selectList("declaration.searchReportAreaPolice",area);
	}

	
	
}
