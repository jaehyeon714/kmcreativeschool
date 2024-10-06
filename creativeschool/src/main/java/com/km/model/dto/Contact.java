package com.km.model.dto;

import java.sql.Date;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Contact {
	private int seq;
	private String title;
	private String contactContent;
	private String writer;
	private Date dateTime;
	private String response;
}
