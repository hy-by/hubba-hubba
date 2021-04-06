package com.hubba.dao;

import java.util.List;

import com.hubba.vo.MenuVO;

public interface MenuDAO {
	public List<MenuVO> selectBusinessMenus(int idx);  
	public void editMenu(List<MenuVO> list); 
	public List<MenuVO> selectTempMenus(); 
	public void updateMenubyadmin(int business_idx,String menu_name, int menu_price);
	public void deleteFromtheTemp(int idx);
	
}
