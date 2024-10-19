package com.km.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.km.model.dto.Police;
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
	public Police selectPoliceByEmail(SqlSession session, String email) {
		return session.selectOne("police.selectPoliceByEmail", email);
	}
	
	@Override
	public List<Police> findIdPw(SqlSession session, String policeEmail) {
		return session.selectList("police.findIdPw");
	}
	
	
	
	@Override
	public int updatePolicePassword(SqlSession session, String email, String newPassword) {
        Map<String, String> params = new HashMap<>();
        params.put("email", email);
        params.put("password", newPassword);
		return session.update("police.updatePolicePassword", params);
	}

	@Override
	public int updatePoliceLog(SqlSession session, Map param) {
		return session.update("police.updatePoliceLog",param);
	}

	@Override
	public List<Map> selectDeclarationCount(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectList("police.selectDeclarationCount",param);
	}
	
	@Override
	public void deletePolice(SqlSession session, String policeIdentity) {
		session.delete("police.deletePolice", policeIdentity);
	}
	

}
