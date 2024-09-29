package com.km.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.km.model.dto.Police;

@Repository
public class PoliceDaolmpl implements PoliceDao{

	@Override
	public Police selectPoliceById(SqlSession session, String id) {
		return session.selectOne("police.selectPoliceById", id);
	}
	
}
