package com.km.model.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ChattingData {
	private long chattingNo;
	private String chattingCategory;
	private String sender;
	private String receiver;
	private String chattingContent;
	private String chattingRoom;
	private Timestamp chattingDate;
}
