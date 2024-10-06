package com.km.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.km.model.dao.QnaDao;
import com.km.model.dto.Contact;

@Service
public class QnaServiceImpl implements QnaService {
	
	@Autowired
	private SqlSessionFactory factory;

	@Autowired
	private SqlSession session;
	
	@Autowired
	private QnaDao dao;
	
	@Override
	public List<Contact> selectAllBoard() {
		return dao.selectAllBoard(session);
	}
	
	@Override
	public Contact findByIdSeq(int seq) {
		return dao.findByIdSeq(session, seq);
	}

	@Override
	public void insertContact(String writer, String title, String contactContent) {
		dao.insertContact(session, writer, title, contactContent);
	}
	
}
