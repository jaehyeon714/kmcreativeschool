package com.km.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.km.model.dto.Police;
import com.km.model.dto.PoliceAttachment;
import com.km.model.dto.PoliceStation;
import com.km.model.service.PoliceServicelmpl;

@Controller
public class PoliceInsertController {
	@Autowired
	private PoliceServicelmpl service;
	
	@RequestMapping("/police/policeinsert.km")
	public String policeinsert() {
		return "police/policeinsert";
	}
	
	@RequestMapping("/police/policeInsertDo.km")
	public String policeInsertDo(Police police, PoliceStation policeStation, MultipartFile policePhoto, HttpSession session) {
		String[] locationArray = policeStation.getPoliceStationAddress().split(" ");
		if (locationArray.length == 5) {
			policeStation.setPoliceStationSido(locationArray[0] + " " + locationArray[1]);
			policeStation.setPoliceStationGungu(locationArray[2]);
			policeStation.setPoliceStationDong(locationArray[3] + " " + locationArray[4]);
		}
		if (locationArray.length == 4) {
			policeStation.setPoliceStationSido(locationArray[0]);
			policeStation.setPoliceStationGungu(locationArray[1]);
			policeStation.setPoliceStationDong(locationArray[2] + " " + locationArray[3]);
		}
		PoliceStation existingStation = service.selectPoliceStaionByName(policeStation.getPoliceStationName());

		if (existingStation != null) { // 만약 경찰서가 이미 있다면 그 경찰서의 번호를 경찰에게 부여
			police.setPoliceStationNo(existingStation.getPoliceStationNo());
		}
		else { // 경찰서가 없다면, 경찰서도 새로 insert하고 그 경찰서의 번호를 가져와 경찰에게 부여
			service.insertpoliceStation(policeStation);
			police.setPoliceStationNo(service.selectPoliceStaionByName(policeStation.getPoliceStationName()).getPoliceStationNo());
		}

		// 경찰 등록
		service.insertPolice(police);

		 if (policePhoto != null && !policePhoto.isEmpty()) {
		        String path = session.getServletContext().getRealPath("/resources/upload/police/");
		        String oriFileName = policePhoto.getOriginalFilename();
		        String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
				int randomNumber = new Random().nextInt(1000) + 1;
				SimpleDateFormat formatDate = new SimpleDateFormat("yyyy_MM_dd_HHmmsssss");
		        String newFileName = "KM_" + formatDate.format(new Date()) + "_" + randomNumber + ext; 
		        try {
		            policePhoto.transferTo(new File(path, newFileName)); 
		            PoliceAttachment attachment = PoliceAttachment.builder()
		            		.policeAttachmentRename(newFileName)
		            		.policeAttachmentOriginalName(oriFileName)
		            		.policeNo(service.selectPoliceById(police.getPoliceIdentity()).getPoliceNo())
		            		.build();
		            service.insertPoliceAttachment(attachment);
		        } catch (Exception e) {
		            e.printStackTrace();
		            return "common/error";
		        }
		    }
		 
	
		return "police/policeenroll";
		
		
	}
		
}
