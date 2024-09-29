package com.km.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PoliceStation {
	private long policeStationNo;
	private String policeStationName; // 경찰서: 인천삼산
	private String policeStationSido; //  인천광역시, 경기도 안양시
	private String policeStationGungu; // 만안구
	private String policeStationDong; // 병목안로 56
	private String policeStationAddress; // 전체
	private String policeStationPhone; // 전화번호
	private String policeStationDiv; // 구분: 파출소
	private String policeStationSidoStation; // 공란
	
}
