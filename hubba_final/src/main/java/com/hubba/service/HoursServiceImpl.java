package com.hubba.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hubba.dao.HoursDAO;
import com.hubba.vo.HoursVO;

@Service
public class HoursServiceImpl implements HoursService {

	@Autowired
	HoursDAO dao;
	
	@Override
	public List<HoursVO> selectBusinessHours(int idx){	
		List<HoursVO> list=	dao.selectBusinessHours(idx);
		
		for(HoursVO temp: list ) {
			switch(temp.getDays()) {
				case 1: temp.setDay_kr("일"); break;
				case 2: temp.setDay_kr("월"); break;
				case 3: temp.setDay_kr("화"); break;
				case 4: temp.setDay_kr("수"); break;
				case 5: temp.setDay_kr("목"); break;
				case 6: temp.setDay_kr("금"); break;
				case 7: temp.setDay_kr("토"); break;
									
			
			
			}
		}
				
		
		return list; 
	}
	
	@Override
	public void edithours(String[]open, String[] close,int business_idx) {
		List<HoursVO> list = new ArrayList<HoursVO>(); 
		
		for(int i=0; i<open.length;i++) {	
			HoursVO vo = new HoursVO(); 
			vo.setBusiness_idx(business_idx);
			vo.setOpen(open[i]);
			vo.setClose(close[i]);
			vo.setDays(i);
			list.add(vo);
			}

		dao.tempHours(list);
	}
	@Override
	public List<HoursVO> adminTempHours(){
		return dao.adminTempHours();
	}
	
	@Override
	public void adminHouredit(String open, String close, int business_idx, int days) {
		dao.adminHouredit(open, close, business_idx, days);
	}
	
	@Override
	public void deleteHourdelete(int idx) {
		dao.deleteHourdelete(idx);
	}
	
	
	
	//새봄추가
	@Override
	   public List<HoursVO> selectToday(int business_idx, int today) {
	      List<HoursVO> list = dao.selectToday(business_idx, today);
	      
	      return list;
	   }
	
}