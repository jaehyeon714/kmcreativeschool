package com.km.model.service;

import java.util.List;

import com.km.model.dto.Contact;

public interface QnaService {
	List<Contact> selectAllBoard();
	List<Contact> findByIdSeq(int seq);
	void insertContact(String title, String writer, String contactContent);
}
