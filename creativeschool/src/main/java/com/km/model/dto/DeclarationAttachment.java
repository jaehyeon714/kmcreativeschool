package com.km.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DeclarationAttachment {
	private long declarationAttachmentNo;
	private String declarationAttachmentRename;
	private String declarationAttachmentOriginalName;
	private long declarationNo;
}
