package com.km.model.service;

import com.km.model.dto.Police;
import com.km.model.dto.Report;

public interface PoliceService {
	Police selectPoliceById(String id);
	int insertPolice(Police police);

}
