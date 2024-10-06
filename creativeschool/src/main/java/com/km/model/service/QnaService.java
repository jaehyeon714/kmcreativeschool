package com.km.model.service;

import java.util.List;

import com.km.model.dto.Contact;

public interface QnaService {
	List<Contact> selectAllBoard();
	Contact findByIdSeq(int seq);
	void insertContact(String writer, String title, String contactContent);
}
