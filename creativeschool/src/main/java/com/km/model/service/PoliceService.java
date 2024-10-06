package com.km.model.service;

import java.util.List;
import java.util.Map;

import com.km.model.dto.Police;
import com.km.model.dto.PoliceStation;

public interface PoliceService {
	Police selectPoliceById(String id);
	Police selectPoliceByEmail(String email);
	int insertPolice(Police police);
	List<Map> selectPoliceAll();
	PoliceStation selectPoliceStaionByName(String name);
	int insertPoliceStation(PoliceStation policeStation);
    int updatePolicePassword(String email, String newPassword);
}
