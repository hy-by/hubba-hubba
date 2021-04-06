package com.hubba.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.hubba.vo.LikesVO;

public class LikesDAOImpl implements LikesDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void checkedLikes(LikesVO vo) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("business_idx", vo.getBusiness_idx());
		map.put("user_idx", vo.getUser_idx());
		map.put("review_idx", vo.getReview_idx());
		
		sqlSession.insert("com.hubba.mapper.LikesMapper.checkedLikes", map);
		
	}

	@Override
	public void uncheckedLikes(int review_idx) {
		sqlSession.delete("com.hubba.mapper.LikesMapper.uncheckedLikes", review_idx);
	}

	@Override
	public int showLikes(int business_idx, int user_idx, int review_idx) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("business_idx", business_idx);
		map.put("user_idx", user_idx);
		map.put("review_idx", review_idx);
		
		int count = sqlSession.selectOne("com.hubba.mapper.LikesMapper.showLikes", map);
		
		return count;
	}

	@Override
	   public List<LikesVO> selectAll(int business_idx) {
	      List<LikesVO> list = sqlSession.selectList("com.hubba.mapper.LikesMapper.selectAll", business_idx);
	      return list;
	   }

	@Override
	   public int countLikes(int business_idx, int review_idx) {
	      Map<String, Integer> map = new HashMap<String, Integer>();
	      map.put("business_idx", business_idx);
	      map.put("review_idx", review_idx);
	      int count = sqlSession.selectOne("com.hubba.mapper.LikesMapper.countLikes", map);
	      return count;
	   }
}
