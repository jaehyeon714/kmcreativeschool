package com.km.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.km.model.dto.Contact;

@Repository
public class QnaDaoImpl implements QnaDao {
	
	@Override
	public List<Contact> selectAllBoard(SqlSession session) {
		return session.selectList("qna.selectAllBoard");
	}
	
	@Override
	public Contact findByIdSeq(SqlSession session, int seq) {
		return session.selectOne("qna.findByIdSeq", seq);
	}
	
	@Override
	public void insertContact(SqlSession session, String writer, String title, String contactContent) {
		session.insert("qna.insertContact");
	}
	
}
