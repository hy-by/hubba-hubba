package com.hubba.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.hubba.vo.BusinessVO;

public class BusinessDAOImpl implements BusinessDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<BusinessVO> selectCategory(String category_group_name) {
		List<BusinessVO> vo = sqlSession.selectList("com.hubba.mapper.BusinessMapper.selectCategory",
				category_group_name);
		return vo;
	}

	@Override
	public List<BusinessVO> bookmarkBusiness(int user_idx) {
		return sqlSession.selectList("com.hubba.mapper.BusinessMapper.bookmarkBusiness", user_idx);
	}

	@Override
	public int businessIdx(String phone, String road_address_name) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("phone", phone);
		map.put("road_address_name", road_address_name);
		return sqlSession.selectOne("com.hubba.mapper.BusinessMapper.businessIdx", map);
	}

	@Override
	public BusinessVO businessInfo(int idx) {
		return sqlSession.selectOne("com.hubba.mapper.BusinessMapper.businessInfo", idx);
	}

	@Override
	public void insertTempPlace(String place_name, String road_address_name, String phone, String x, String y,
			String category_group_name) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("place_name", place_name);
		map.put("road_address_name", road_address_name);
		map.put("phone", phone);
		map.put("x", x);
		map.put("y", y);
		map.put("category_group_name", category_group_name);

		sqlSession.insert("com.hubba.mapper.BusinessMapper.insertTempPlace", map);

	}

	@Override
	public List<BusinessVO> selectAllTempPlace() {
		return sqlSession.selectList("com.hubba.mapper.BusinessMapper.selectAllTempPlace");
	}

	@Override
	public void insertBusiness(String place_name, String road_address_name, String phone, String x, String y,
			String category_group_name) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("place_name", place_name);
		map.put("road_address_name", road_address_name);
		map.put("phone", phone);
		map.put("x", x);
		map.put("y", y);
		map.put("category_group_name", category_group_name);

		sqlSession.insert("com.hubba.mapper.BusinessMapper.insertBusiness", map);

	}

	@Override
	public void deleteTempPlace(int idx) {
		sqlSession.delete("com.hubba.mapper.BusinessMapper.deleteTempPlace", idx);

	}

	// 도연추가
	@Override
	public List<BusinessVO> selectinfiniteloading(Map categories) {
		List<BusinessVO> vo = sqlSession.selectList("com.hubba.mapper.BusinessMapper.selectinfiniteloading",
				categories);
		return vo;
	}

	@Override
	public BusinessVO selectBusinessDetails(int idx) {
		BusinessVO vo = sqlSession.selectOne("com.hubba.mapper.BusinessMapper.selectBusinessDetails", idx);
		return vo;

	}

	@Override
	public String getReviewImages(int idx) {
		String str = sqlSession.selectOne("com.hubba.mapper.BusinessMapper.getReviewImages", idx);
		return str;

	}

	// 새봄추가
	@Override
	public List<BusinessVO> getBusinessInfo(String keyword, String x, String y) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("x", x);
		map.put("y", y);
		map.put("place_name", keyword);
		map.put("category_group_name", keyword);

		System.out.println("dao x >>" + x);
		System.out.println("dao y >>" + y);
		System.out.println("dao keyword >>" + keyword);

		List<BusinessVO> list = sqlSession.selectList("com.hubba.mapper.BusinessMapper.selectBusinessInfo", map);
		System.out.println("dao의 list>>" + list);

		return list;
	}

	@Override
	public void updateRating(int idx, double review_rating) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("idx", idx);
		map.put("review_rating", review_rating);
		sqlSession.update("com.hubba.mapper.BusinessMapper.updateRating", map);
	}

	@Override
	public String getReviewImage(int idx) {
		String imageName = sqlSession.selectOne("com.hubba.mapper.BusinessMapper.getReviewImages", idx);

		return imageName;
	}

}
