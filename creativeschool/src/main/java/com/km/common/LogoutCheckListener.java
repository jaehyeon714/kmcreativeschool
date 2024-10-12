package com.km.common;

import java.util.Map;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

import com.km.model.dto.Police;
import com.km.model.service.PoliceService;


@WebListener
public class LogoutCheckListener implements HttpSessionAttributeListener{
		
	@Override
	public void attributeRemoved(HttpSessionBindingEvent event) {
		System.out.println(event.getName());
		if(event.getName().equals("loginPolice")) {
			Police police=(Police)event.getValue();
			PoliceService service=SpringContext.getBean(PoliceService.class);
			service.updatePoliceLog(Map.of("flag","out","id",police.getPoliceIdentity()));	
		}
	}	
	
}
