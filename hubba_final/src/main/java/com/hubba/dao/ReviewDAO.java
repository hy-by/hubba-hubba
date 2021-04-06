package com.hubba.dao;

import java.util.List;
import com.hubba.vo.ReviewVO;

public interface ReviewDAO {

	public List<ReviewVO> myReviewList(int user_idx);
	public void deleteMyReview(int idx);
	
	//도연추가
	public void multiFileUpload(ReviewVO vo);
	public String randompicture(int idx); 
	public List<String> selectallpictures(int idx);

	
	//새봄추가
	public void insertReview(ReviewVO vo);
	public List<ReviewVO> selectAllReview(int business_idx);
	public int countAllReview(int business_idx);
	public double ratingAvg(int business_idx);
	public void updateLikes(int business_idx, int idx, int total_likes);
	public List<ReviewVO> selectNewReview();
	
}
