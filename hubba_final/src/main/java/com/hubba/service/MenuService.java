package com.hubba.service;

import java.util.List;

import com.hubba.vo.MenuVO;

public interface MenuService {
	public List<MenuVO> selectBusinessMenus(int idx);  
	public void editMenu(String[]menu_name,int [] menu_price,int business_idx);
	public List<MenuVO> selectTempMenus(); 
	public void updateMenubyadmin(int business_idx,String menu_name, int menu_price);
	public void deleteFromtheTemp(int idx);
}
