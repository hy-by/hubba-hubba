package com.hubba.service;

import java.util.List;

import com.hubba.vo.HoursVO;

public interface HoursService {
	public List<HoursVO> selectBusinessHours(int idx);
	public void edithours(String[]open, String[] close, int business_idx);
	public List<HoursVO> adminTempHours();
	public void adminHouredit(String open, String close, int business_idx, int days);
	public void deleteHourdelete(int idx);
	
	//새봄추가
	public List<HoursVO> selectToday(int business_idx, int today);
}
