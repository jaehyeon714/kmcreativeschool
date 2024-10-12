package com.km.model.service;

import java.util.List;
import java.util.Map;

import com.km.model.dto.Report;

public interface DeclarationService {

	int insertDeclaration(Report report);
	
	List<Map> selectReportAll(Map param);
	long selectReportAllCount(String id);
	List<Map> selectReportSearch(Map<String,Object> mapKeyword);
	
	boolean reportSendPolice(Report report, String url);
	Report selectReportByNo(long no);
	
	String updateStatus(String status, String id);
	public List<Map<String, Object>> selectReportsByEmailAndPassword(String email, String password);
}
