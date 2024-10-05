package com.km.model.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Contact {
	private Number id_seq;
	private String title;
	private String contactContent;
	private String writer;
	private LocalDateTime dateTime;
	private String response;
}
