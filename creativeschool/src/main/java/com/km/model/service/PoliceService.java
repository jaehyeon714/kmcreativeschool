package com.km.model.service;

import java.util.List;
import java.util.Map;

import com.km.model.dto.Police;
import com.km.model.dto.PoliceAttachment;
import com.km.model.dto.PoliceStation;

public interface PoliceService {
	Police selectPoliceById(String id);
	int insertPolice(Police police);
	List<Map> selectPoliceAll();
	PoliceStation selectPoliceStaionByName(String name);
	int insertpoliceStation(PoliceStation policeStation);
	int insertPoliceAttachment(PoliceAttachment attachment);
}
