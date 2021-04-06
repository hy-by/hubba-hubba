package com.hubba.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class BookmarkDAOImpl implements BookmarkDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void deleteBookmark(int user_idx, int business_idx) {
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("user_idx", user_idx);
		map.put("business_idx",business_idx);
		sqlSession.delete("com.hubba.mapper.BookmarkMapper.deleteBookmark",map);
	}

	@Override
	public void insertBookmark(int user_idx, int business_idx) {
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("user_idx", user_idx);
		map.put("business_idx",business_idx);
		sqlSession.insert("com.hubba.mapper.BookmarkMapper.insertBookmark",map);
	}

	//민희 추가
	@Override
	public int checkBookmark(int user_idx, int business_idx) {
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("user_idx", user_idx);
		map.put("business_idx",business_idx);
		return sqlSession.selectOne("com.hubba.mapper.BookmarkMapper.checkBookmark",map);
	}
	
	
	

}
