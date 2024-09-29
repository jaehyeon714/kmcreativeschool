package com.km.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.km.model.dto.Police;

public interface PoliceDao {
	Police selectPoliceById(SqlSession session,  String id);
}
