package com.km.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PoliceAttachment {
	private long policeAttachmentNo;
	private String policeAttachmentRename;
	private String policeAttachmentOriginalName;
	private long policeNo;
}
