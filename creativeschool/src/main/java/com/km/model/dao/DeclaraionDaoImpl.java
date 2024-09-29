package com.km.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.km.model.dto.Attacker;
import com.km.model.dto.DeclarationAttachment;
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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertAttacker(SqlSession session, Attacker attacker) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertDeclarationAttachment(SqlSession session, DeclarationAttachment file) {
		// TODO Auto-generated method stub
		return 0;
	}

}
