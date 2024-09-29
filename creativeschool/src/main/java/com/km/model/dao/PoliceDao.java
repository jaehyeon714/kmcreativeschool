package com.km.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.km.model.dto.Police;

public interface PoliceDao {
	Police selectPoliceById(SqlSession session,  String id);
	int insertPolice(SqlSession session,  Police police);
	List<Map> selectPoliceAll(SqlSession session);
}
