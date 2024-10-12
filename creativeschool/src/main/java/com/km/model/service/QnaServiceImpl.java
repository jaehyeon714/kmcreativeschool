package com.km.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.km.model.dao.QnaDao;
import com.km.model.dto.Contact;

@Service
public class QnaServiceImpl implements QnaService {
    
    @Autowired
    private SqlSession session;
    
    @Autowired
    private QnaDao dao;

    // 모든 게시글 가져오기
    @Override
    public List<Contact> selectAllBoard() {
        return dao.selectAllBoard(session);
    }

    // 특정 게시글 시퀀스로 검색
    @Override
    public Contact findByIdSeq(int seq) {
        return dao.findByIdSeq(session, seq);
    }

    @Override
    public void insertContact(Contact contact) {
    		dao.insertContact(session, contact);
    }
}
