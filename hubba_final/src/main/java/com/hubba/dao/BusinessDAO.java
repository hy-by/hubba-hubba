package com.hubba.dao;

import java.util.List;
import java.util.Map;
import com.hubba.vo.BusinessVO;

public interface BusinessDAO {
	
	public List<BusinessVO> selectCategory(String category_group_name);
	public List<BusinessVO> bookmarkBusiness(int user_idx);
	public int businessIdx(String phone, String road_address_name);
	public BusinessVO businessInfo(int idx);
	public void insertTempPlace(String place_name,String road_address_name,String phone,String x,String y,String category_group_name);
	public List<BusinessVO> selectAllTempPlace();
	public void insertBusiness(String place_name,String road_address_name,String phone,String x,String y,String category_group_name);
	public void deleteTempPlace(int idx);
	
	//도연추가
	public List<BusinessVO> selectinfiniteloading(Map categories);
	public BusinessVO selectBusinessDetails(int idx);
	public String getReviewImages(int idx);
	
	//새봄추가
	public List<BusinessVO> getBusinessInfo(String keyword, String x, String y);
	public void updateRating(int idx, double review_rating);
	public String getReviewImage(int idx);
}
