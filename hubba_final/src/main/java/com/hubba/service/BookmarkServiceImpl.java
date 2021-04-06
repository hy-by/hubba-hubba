package com.hubba.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hubba.dao.BookmarkDAOImpl;

@Service
public class BookmarkServiceImpl implements BookmarkService {
	
	@Autowired
	BookmarkDAOImpl dao;

	@Override
	public void deleteBookmark(int user_idx, int business_idx) {
		dao.deleteBookmark(user_idx, business_idx);
		
	}

	@Override
	public void insertBookmark(int user_idx, int business_idx) {
		dao.insertBookmark(user_idx, business_idx);
		
	}
	
	
	//민희 0514 추가
	@Override
	public int checkBookmark(int user_idx, int business_idx) {
		return dao.checkBookmark(user_idx, business_idx);
	}
	
	
	

	
}
