package com.hubba.service;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hubba.dao.BusinessDAOImpl;
import com.hubba.dao.HoursDAOImpl;
import com.hubba.vo.BusinessVO;
import com.hubba.vo.HoursVO;

@Service
public class BusinessServiceImpl implements BusinessService {

	@Autowired
	BusinessDAOImpl dao;
	
	@Autowired
	HoursDAOImpl hour;
	
	@Override
	public List<BusinessVO> bookmarkBusiness(int user_idx) {
		return dao.bookmarkBusiness(user_idx);
	}

	@Override
	public int businessIdx(String phone, String road_address_name) {
		return dao.businessIdx(phone,road_address_name);
	}

	@Override
	public void insertTempPlace(String place_name, String road_address_name, String phone, String x, String y,
			String category_group_name) {
		dao.insertTempPlace(place_name, road_address_name, phone, x, y, category_group_name);
	}

	@Override
	public List<BusinessVO> selectAllTempPlace() {
		return dao.selectAllTempPlace();
	}

	@Override
	public void insertBusiness(String place_name, String road_address_name, String phone, String x, String y,
			String category_group_name) {
		dao.insertBusiness(place_name, road_address_name, phone, x, y, category_group_name);
		
	}

	@Override
	public void deleteTempPlace(int idx) {
		dao.deleteTempPlace(idx);
		
	}
	
	
	
	
	

	// 도연추가
	@Override
	public List<BusinessVO> selectCategory(String category_group_name) {
		return dao.selectCategory(category_group_name);

	}

	@Override
	public List<BusinessVO> selectinfiniteloading(Map categories) {
		List<BusinessVO> vo = dao.selectinfiniteloading(categories);
		String[] strArray = new String[] {};
		Calendar cal = Calendar.getInstance();
		int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
		System.out.println("today's day: " + dayOfWeek);

		for (int i = 0; i < 10; i++) {
			String str = dao.getReviewImages(vo.get(i).getIdx());
			List<HoursVO> today = hour.selectToday(vo.get(i).getIdx(), dayOfWeek);
			String str3 = "";
			for (HoursVO temp : today) {

				System.out.println(temp.getOpen() + temp.getClose() + temp.getBusiness_idx());
				str3 = temp.getOpen() + "-" + temp.getClose();

				vo.get(i).setToday(str3);
				System.out.println(vo.get(i).getToday());

			}

			if (str != null) {
				strArray = str.split("&");
				str = strArray[0];
				vo.get(i).setImages(str);

//				if(today.get(i).getOpen()!=null && today.get(i).getClose()!=null) {
//						vo.get(i).setToday(today.get(i).getOpen() +"-"+ today.get(i).getClose());
//				}

			} else {
				vo.get(i).setImages("huba.png");

			}
		}

		return vo;
	}

	@Override
	public BusinessVO selectBusinessDetails(int idx) {
		return dao.selectBusinessDetails(idx);
	}
	
	
	
	
	//새봄추가
	@Override
	public List<BusinessVO> getBusinessInfo(String keyword, String x, String y) {
		List<BusinessVO> list = dao.getBusinessInfo(keyword, x, y);
		
		return list;
	}
	@Override
	   public void updateRating(int idx, double review_rating) {
	      dao.updateRating(idx, review_rating);
	   }
	@Override
	public String getReviewImage(int idx) {
		String imageName = dao.getReviewImage(idx);
		return imageName;
	}
}
