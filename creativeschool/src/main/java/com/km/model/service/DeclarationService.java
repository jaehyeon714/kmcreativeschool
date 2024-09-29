package com.km.model.service;

import java.util.List;
import java.util.Map;

import com.km.model.dto.Report;

public interface DeclarationService {

	int insertDeclaration(Report report);
	
	List<Report> selectReportAll(Map param);
	
	List<Report> selectReportSearch(Map<String,String> mapKeyword);
	
	boolean reportSendPolice(Report report);
	
}
