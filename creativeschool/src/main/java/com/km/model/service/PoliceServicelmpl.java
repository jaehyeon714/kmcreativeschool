package com.km.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.km.model.dao.PoliceDao;
import com.km.model.dto.Police;
import com.km.model.dto.PoliceStation;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PoliceServicelmpl implements PoliceService{
	
	@Autowired
	private PoliceDao dao;
	
	@Autowired
	private SqlSession session;
	
	@Override
	public Police selectPoliceById(String id) {
		return dao.selectPoliceById(session, id);
	}
	

	@Override
	public int insertPolice(Police police) {
		dao.insertPolice(session, police);
		return 1;
	}

	@Override
	public List<Map> selectPoliceAll() {
		return dao.selectPoliceAll(session);
	}



	@Override
	public PoliceStation selectPoliceStaionByName(String name) {
		return dao.selectPoliceStationByName(session, name);
	}



	@Override
	public int insertPoliceStation(PoliceStation policeStation) {
		return dao.insertPoliceStation(session, policeStation);
	}


	@Override
	public Police selectPoliceByEmail(String email) {
		return dao.selectPoliceByEmail(session, email);
	}


	@Override
	public int updatePolicePassword(String email, String newPassword) {
		return dao.updatePolicePassword(session, email, newPassword);
	}
	
	@Override
	public List<Police> findIdPw(String policeEmail) {
		return dao.findIdPw(session, policeEmail);
	}


	@Override
	public void updatePoliceLog(Map param) {
		int result=dao.updatePoliceLog(session, param);
		if(result==0) {
			log.error(param.get("id")+"logout log수정실패");
		}
	}


	@Override
	public List<Map> selectDeclarationCount(Map param) {
		// TODO Auto-generated method stub
		return dao.selectDeclarationCount(session,param);
	}


	@Override
	public List<Map> selectReportSearch(Map<String, Object> mapKeyword) {
		// TODO Auto-generated method stub
		return dao.selectReportSearch(session, mapKeyword);
	}


	@Override
	public long selectReportByParamCount(Map<String,Object> param) {
		// TODO Auto-generated method stub
		return dao.selectReportByParamCount(session,param);
	}
	
	
	
	
	
	

}
