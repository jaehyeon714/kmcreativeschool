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
	private String policeStationName;
	private String policeStationSido;
	private String policeStationGungu;
	private String policeStationDong;
	private String policeStationAddress;
	private String policeStationPhone;
	private String policeStationDiv;
	private String policeStationSidoStation;
	
}
