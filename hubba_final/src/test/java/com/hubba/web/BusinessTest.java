package com.hubba.web;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hubba.dao.BusinessDAO;
import com.hubba.vo.BusinessVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class BusinessTest {

	@Autowired
	private BusinessDAO dao;
	
	@Test
	public void selectCategory() throws Exception{
		List<BusinessVO> list = dao.selectCategory("ю╫╫да║");	
		System.out.println(list.get(0).getPlace_name());
	}
	
//	@Test
//	public void testBookmarkBusiness() throws Exception{
//		List<BusinessVO> list = dao.bookmarkBusiness(8);
//		for(BusinessVO tmp : list) {
//			System.out.println(tmp.getBusiness_idx());
//		}
//	}
	
	@Test
	public void testSelectAllTempPlace() throws Exception{
		List<BusinessVO> list = dao.selectAllTempPlace();
		for(BusinessVO tmp : list) {
			System.out.println(tmp.getIdx());
		}
		
	}
	
}
