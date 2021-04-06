package com.hubba.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.hubba.vo.ReviewVO;

public class ReviewDAOImpl implements ReviewDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ReviewVO> myReviewList(int user_idx) {
		return sqlSession.selectList("com.hubba.mapper.ReviewMapper.myReviewList",user_idx);
	}

	@Override
	public void deleteMyReview(int idx) {
		//Map<String ,Integer> map = new HashMap<String, Integer>();
		//map.put("user_idx", user_idx);
		//map.put("business_idx", business_idx);
		sqlSession.delete("com.hubba.mapper.ReviewMapper.deleteMyReview",idx);
		
	}
	
	
	//도연추가
	@Override
	public void multiFileUpload(ReviewVO vo) {
		sqlSession.insert("com.hubba.mapper.ReviewMapper.InsertReview",vo);
	}
	
	@Override
	public String randompicture(int idx) {
		String randompicture =  sqlSession.selectOne("com.hubba.mapper.ReviewMapper.getImages",idx);
		return randompicture;
	}

	@Override
	public List<String> selectallpictures(int idx) {
		List<String> str = sqlSession.selectList("com.hubba.mapper.ReviewMapper.selectallimages",idx);
		
		
		return str; 
				
			
	}
	
	
	
	//새봄추가

	@Override
	public void insertReview(ReviewVO vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_idx", vo.getUser_idx());
		map.put("business_idx", vo.getBusiness_idx());
		map.put("rating", vo.getRating());
		map.put("content", vo.getContent());
		map.put("images", vo.getImages());
		
		sqlSession.insert("com.hubba.mapper.ReviewMapper.insertReview", map);
		
	}


	@Override
	public List<ReviewVO> selectAllReview(int business_idx) {
		
		List<ReviewVO> list = sqlSession.selectList("com.hubba.mapper.ReviewMapper.selectAllReview", business_idx);
		return list;
	}

	@Override
	public int countAllReview(int business_idx) {
		int count = sqlSession.selectOne("com.hubba.mapper.ReviewMapper.countAllReview", business_idx);
		return count;
	}
	
	@Override
	   public double ratingAvg(int business_idx) {
	      double average = sqlSession.selectOne("com.hubba.mapper.ReviewMapper.averageReview", business_idx);
	      
	      return average;
	   }
	@Override
	   public void updateLikes(int business_idx, int idx, int total_likes) {
	      Map<String, Object> map = new HashMap<String, Object>();
	      map.put("business_idx", business_idx);
	      map.put("idx", idx);
	      map.put("total_likes", total_likes);
	      
	      sqlSession.update("com.hubba.mapper.ReviewMapper.updateLikes", map);
	      
	   }
	@Override
	public List<ReviewVO> selectNewReview() {
		List<ReviewVO> list = sqlSession.selectList("com.hubba.mapper.ReviewMapper.newReview");
		return list;
	}

	   
	
}
