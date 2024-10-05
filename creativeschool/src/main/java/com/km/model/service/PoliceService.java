package com.km.model.service;

import java.util.List;
import java.util.Map;

import com.km.model.dto.Police;

public interface PoliceService {
	Police selectPoliceById(String id);
	int insertPolice(Police police);
	List<Map> selectPoliceAll();
	List<Police> findIdPw(String policeEmail);
}
