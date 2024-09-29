package com.km.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Attacker {
	private long attackerNo;
	private String attackerName;
	private String attackerSchool;
	private String attackerGender;
	private String attackerAddress;
	private String attackerContact;
	private String attackerInfo;
	private long declarationNo;
	
}
