package com.hubba.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.hubba.vo.MenuVO;

public class MenuDAOImpl implements MenuDAO {
	@Autowired
	private SqlSession sqlSession; 
	
	@Override
	public List<MenuVO> selectBusinessMenus(int idx){
		List<MenuVO> selectBusinessMenus = sqlSession.selectList("com.hubba.mapper.MenuMapper.selectBusinessMenus",idx); 
		return selectBusinessMenus;
	}
	
	@Override
	public void editMenu(List<MenuVO> list) {
		for(MenuVO temp: list) {
			sqlSession.insert("com.hubba.mapper.MenuMapper.editMenu",temp);
		}
	}
	@Override
	public List<MenuVO> selectTempMenus(){
		List<MenuVO> tempMenu = sqlSession.selectList("com.hubba.mapper.MenuMapper.selectTempMenus");
		return tempMenu; 
	}
	
	@Override
	public void updateMenubyadmin(int business_idx,String menu_name, int menu_price) {
		MenuVO vo = new MenuVO(); 
		vo.setMenu_name(menu_name);
		vo.setBusiness_idx(business_idx);
		vo.setMenu_price(menu_price);
		sqlSession.update("com.hubba.mapper.MenuMapper.updateMenu",vo);
	}
	
	@Override
	public void deleteFromtheTemp(int idx) {
		sqlSession.delete("com.hubba.mapper.MenuMapper.deleteFromtheTemp",idx);
	}
}
