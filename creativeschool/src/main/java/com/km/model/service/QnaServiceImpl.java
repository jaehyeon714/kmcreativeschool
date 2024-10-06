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
    private SqlSessionFactory factory;

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

    // 트랜잭션 관리를 위해 @Transactional 추가
    @Override
    @Transactional
    public void insertContact(String writer, String title, String contactContent) {
        try {
            dao.insertContact(session, writer, title, contactContent);
        } catch (Exception e) {
            // 예외 발생 시 로그를 기록하고 다시 예외를 던짐
            System.err.println("Error occurred while inserting contact: " + e.getMessage());
            throw new RuntimeException("Failed to insert contact", e);
        }
    }
}
