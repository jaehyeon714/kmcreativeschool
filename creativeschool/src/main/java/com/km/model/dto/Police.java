package com.km.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Police {
	private long policeNo;
	private String policeName;
	private String policeEmail;
	private String policeGrade;
	private String policeProfile;
	private String policeIdentity;
	private String policeLog;
	private String policePhone;
	private long policeStationNo;
	private String policePassword;
}
