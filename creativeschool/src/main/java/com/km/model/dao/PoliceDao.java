package com.km.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.km.model.dto.Police;
import com.km.model.dto.Report;

public interface PoliceDao {
	Police selectPoliceById(SqlSession session,  String id);
	int insertPolice(SqlSession session,  Police police);
}
