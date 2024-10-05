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
	
}
