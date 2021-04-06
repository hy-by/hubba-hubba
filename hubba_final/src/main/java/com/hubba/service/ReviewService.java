package com.hubba.service;

import java.util.List;

import javax.servlet.ServletContext;

import com.hubba.vo.MyReviewVO;
import com.hubba.vo.ReviewVO;

public interface ReviewService {

	public List<MyReviewVO> myReviewList(int user_idx);
	public void deleteMyReview(int idx);
	
	//도연추가
	public void multiFileUpload(ReviewVO vo, ServletContext application);
	public String[] randompicture(int idx);
	public String[] selectallpictures(int idx);
	
	//새봄추가
	public void insertReview(ReviewVO vo);
	public List<ReviewVO> selectAllReview(int business_idx);
	public int countAllReview(int business_idx);
	public double reviewAvg(int business_idx);
	public void updateLikes(int business_idx, int idx, int total_likes);
	public List<ReviewVO> selectNewReview();
}
