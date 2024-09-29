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
	private String policeName;
	private String policeEmail;
	private String policeGrade;
	private String policeProfile;
	private String policeIdentity;
	private String policeIog;
	private String policePhone;
	private String policeStation;
	private String policePassword;
}
