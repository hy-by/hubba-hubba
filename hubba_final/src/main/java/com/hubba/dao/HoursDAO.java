package com.hubba.dao;

import java.util.List;

import com.hubba.vo.HoursVO;

public interface HoursDAO {
	public List<HoursVO> selectBusinessHours(int idx); 
	public void tempHours(List<HoursVO> vo);
	public List<HoursVO> adminTempHours();
	public void adminHouredit(String open, String close, int business_idx, int days);
	public void deleteHourdelete(int idx);
	
	//새봄추가
	public List<HoursVO> selectToday(int business_idx, int today);
}
