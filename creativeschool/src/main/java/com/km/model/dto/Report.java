package com.km.model.dto;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Report {
	private long reportNo;
	private String reportType;
	private String incidentAddress;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	private LocalDateTime incidentTime;
	private String incidentDetails;
	private List<Attacker> attackers;
	
	private List<DeclarationAttachment> files=new ArrayList<>();
	private Reporter reporter;
	
	private String status;
	
	private String sido;
	private String gungu;
	private String dong;//도로명주소 
	
	
}
