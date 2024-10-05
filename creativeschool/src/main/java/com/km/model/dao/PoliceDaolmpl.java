package com.km.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.km.model.dto.Police;

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
	
	
	
}
