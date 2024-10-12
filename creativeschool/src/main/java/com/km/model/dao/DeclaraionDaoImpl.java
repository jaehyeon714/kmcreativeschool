package com.km.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
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
	public List<Map> selectReportAll(SqlSession session, Map param) {
		 int cPage=(int)param.get("cPage");
		 int numPerpage=(int)param.get("numPerpage");
		RowBounds rb=new RowBounds((cPage-1)*numPerpage,numPerpage);
		return session.selectList("declaration.selectReportAll",param,rb);
	}

	@Override
	public List<Map> selectReportSearch(SqlSession session, Map<String, Object> mapKeyword) {
		return session.selectList("declaration.selectReportSearch",mapKeyword);
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
	public List<Map> searchReportAreaPolice(SqlSession session, Map area) {
		List<Map> result=session.selectList("declaration.searchReportAreaPolice",area);
		//동으로 조회
		if(result.size()>0) return result;
		//없으면 군구로 조회하기
		else return session.selectList("declaration.searchReportAreaPolice2",area);
	}

	@Override
	public int insertJoinReport(SqlSession session, Map data) {
		// TODO Auto-generated method stub
		return session.insert("declaration.insertJoinReport",data);
	}

	@Override
	public long selectReportAllCount(SqlSession session, String id) {
		// TODO Auto-generated method stub
		return session.selectOne("declaration.selectReportAllCount",id);
	}

	@Override
	public Report selectReportByNo(SqlSession session, long no) {
		// TODO Auto-generated method stub
		return session.selectOne("declaration.selectReportByNo",no);
	}
	
	@Override
	public String updateStatus(SqlSession session, String status, String id) {
	    int result = session.update("declaration.updateStatus", status);
	    return String.valueOf(result);
	}

	@Override
	public List<Map<String, Object>> selectReportsByEmailAndPassword(SqlSession session, Map<String, String> map) {
		return session.selectList("declaration.selectReportByEmailAndPassword", map);
	}

	
	

	
	
}
