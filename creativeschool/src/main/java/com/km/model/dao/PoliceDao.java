package com.km.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.km.model.dto.Police;
import com.km.model.dto.PoliceAttachment;
import com.km.model.dto.PoliceStation;

public interface PoliceDao {
	Police selectPoliceById(SqlSession session,  String id);
	int insertPolice(SqlSession session,  Police police);
	List<Map> selectPoliceAll(SqlSession session);
	PoliceStation selectPoliceStationByName(SqlSession session, String name);
	int insertPoliceStation(SqlSession session, PoliceStation policeStation);
	int insertPoliceAttachment(SqlSession session, PoliceAttachment attachment);
}
