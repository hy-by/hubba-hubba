package com.hubba.web;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hubba.dao.BusinessDAO;
import com.hubba.dao.ReviewDAO;
import com.hubba.vo.ReviewVO;
import com.hubba.vo.TestVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class ReviewTest {

	@Autowired
	private ReviewDAO dao;
	
	@Autowired
	private BusinessDAO bdao;
	

	
	
	@Test
	public void myReviewList() throws Exception{
		List<ReviewVO> list = dao.myReviewList(8);
		
		for(ReviewVO tmp : list) {
			System.out.println(tmp.getContent());
			System.out.println(bdao.businessInfo(tmp.getBusiness_idx()).getPlace_name());
			System.out.println(bdao.businessInfo(tmp.getBusiness_idx()).getRoad_address_name());
		}
	}
	
	@Test
	public void testReviewAvg() throws Exception{
		double average = dao.ratingAvg(318);
		System.out.println(average);
	}
	
	
	
	
	
}
