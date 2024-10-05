package com.km.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.km.model.dao.QnaDao;
import com.km.model.dto.Contact;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	private SqlSession session;
	
	@Autowired
	private QnaDao dao;
	
	@Override
	public List<Contact> selectAllBoard() {
		return dao.selectAllBoard(session);
	}
	
	@Override
	public List<Contact> findByIdSeq(int seq) {
		return dao.findByIdSeq(session, seq);
	}
	
	@Override
	public void insertContact(String title, String writer, String contactContent) {
		dao.insertContact(session, title, writer, contactContent);
	}
	
}
