package com.hubba.dao;


import java.util.List;

import com.hubba.vo.LikesVO;
import com.hubba.vo.ReviewVO;

public interface LikesDAO {
	public List<LikesVO> selectAll(int business_idx);
	public void checkedLikes(LikesVO vo);
	public void uncheckedLikes(int review_idx);
	public int showLikes(int business_idx, int user_idx, int review_idx);
	public int countLikes(int business_idx, int review_idx);
	

}
