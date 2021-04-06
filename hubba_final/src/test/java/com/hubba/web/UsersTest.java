package com.hubba.web;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hubba.dao.UsersDAO;
import com.hubba.vo.UsersVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class UsersTest {
	
	@Autowired
	private UsersDAO dao; 
	
	@Test
	public void testIdCheck() throws Exception{
		System.out.println(dao.idCheck("fp156"));
	}
	
	@Test
	public void testEmailCheck() throws Exception{
		System.out.println(dao.emailCheck("fp156@naver.com"));
	}
	
	@Test
	public void testPwCheck() throws Exception{
		UsersVO uvo = dao.pwCheck("test001");
		System.out.println(uvo.getId()+"/"+uvo.getPw()+"/"+uvo.getName());
		
	}
	
	@Test
	public void testFindId() throws Exception{
		int countStr = dao.countFindId("민희1", "fp156@naver.com");
		String str = dao.findId("민희1", "fp156@naver.com");
		if(countStr==1) {
			System.out.println(str);
		}else {
			System.out.println("없네요");
		}
	}
	

	
}
