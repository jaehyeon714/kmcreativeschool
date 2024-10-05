package com.km.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.km.model.dto.Contact;

public interface QnaDao {
	List<Contact> selectAllBoard(SqlSession session);
}
