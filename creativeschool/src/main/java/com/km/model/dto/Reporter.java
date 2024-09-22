package com.km.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Reporter {
	private long reporterNo;
	private String reporterName;
	private String reporterEmail;
	private String reporterPhone;
	private String reporterSchool;
	private String reporterPassword;
}






