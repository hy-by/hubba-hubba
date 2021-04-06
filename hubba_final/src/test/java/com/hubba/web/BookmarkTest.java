package com.hubba.web;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hubba.dao.BookmarkDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class BookmarkTest {

	@Autowired
	private BookmarkDAO bdao;
	
	@Test
	public void testInsertBoolmark() throws Exception{
		bdao.insertBookmark(5,10);
	}
	
}
