package com.hubba.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hubba.dao.LikesDAO;
import com.hubba.vo.LikesVO;

@Service
public class LikesServiceImpl implements LikesService {

	@Autowired
	LikesDAO dao;

	@Override
	public void checkedLikes(LikesVO vo) {
		dao.checkedLikes(vo);
		
	}

	@Override
	public void uncheckedLikes(int review_idx) {
		dao.uncheckedLikes(review_idx);
	}

	@Override
	public int showLikes(int business_idx, int user_idx, int review_idx) {
		int count = dao.showLikes(business_idx, user_idx, review_idx);
		return count;
	}

	@Override
	   public List<LikesVO> selectAll(int business_idx) {
	      List<LikesVO> list = dao.selectAll(business_idx);
	      return list;
	   }
	
	@Override
	   public int countLikes(int business_idx, int review_idx) {
	      int count = dao.countLikes(business_idx, review_idx);
	      return count;
	   }
	
}
