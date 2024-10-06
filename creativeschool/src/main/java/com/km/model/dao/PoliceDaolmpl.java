package com.km.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.km.model.dto.Police;
import com.km.model.dto.PoliceAttachment;
import com.km.model.dto.PoliceStation;

@Repository
public class PoliceDaolmpl implements PoliceDao{

	@Override
	public Police selectPoliceById(SqlSession session, String id) {
		return session.selectOne("police.selectPoliceById", id);
	}

	@Override
	public int insertPolice(SqlSession session, Police police) {
		 return session.insert("police.insertPolice", police);
	}
	
	

	@Override
	public List<Map> selectPoliceAll(SqlSession session) {
		return session.selectList("police.selectPoliceAll");
	}

	@Override
	public PoliceStation selectPoliceStationByName(SqlSession session, String name) {
		return session.selectOne("police.selectPoliceStationByName", name);
	}

	@Override
	public int insertPoliceStation(SqlSession session, PoliceStation policeStation) {
		return session.insert("police.insertPoliceStation", policeStation);
	}

	@Override
	public int insertPoliceAttachment(SqlSession session, PoliceAttachment attachment) {
		return session.insert("police.insertPoliceAttachment", attachment);
	}
	
	@Override
	public List<Police> findIdPw(SqlSession session, String policeEmail) {
		return session.selectList("police.findIdPw");
	}
	
	
	
}
