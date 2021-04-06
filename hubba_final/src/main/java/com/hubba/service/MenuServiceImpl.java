package com.hubba.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hubba.dao.MenuDAO;
import com.hubba.vo.MenuVO;

@Service
public class MenuServiceImpl implements MenuService {
	@Autowired
	MenuDAO dao;
	
	public List<MenuVO> selectBusinessMenus(int idx){
		return dao.selectBusinessMenus(idx);
	}
	
	public void editMenu(String[]menu_name,int [] menu_price,int business_idx) {
		List<MenuVO> list = new ArrayList<MenuVO>();
		
		for(int i=0; i<menu_name.length; i++) {
			MenuVO vo = new MenuVO(); 
			vo.setMenu_name(menu_name[i]);
			vo.setMenu_price(menu_price[i]);
			vo.setBusiness_idx(business_idx);
			
			list.add(vo);
		}
		dao.editMenu(list); 
	}
	@Override
	public List<MenuVO> selectTempMenus(){
		 return dao.selectTempMenus();
	}

	@Override
	public void updateMenubyadmin(int business_idx,String menu_name, int menu_price) {
		dao.updateMenubyadmin(business_idx, menu_name, menu_price);
	}
	
	@Override
	public void deleteFromtheTemp(int idx) {
		dao.deleteFromtheTemp(idx);
	}
}
