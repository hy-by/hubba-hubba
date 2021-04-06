package com.hubba.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.hubba.vo.HoursVO;

public class HoursDAOImpl implements HoursDAO {
	@Autowired
	private SqlSession sqlSession; 
	
	@Override
	public List<HoursVO> selectBusinessHours(int idx){
		List<HoursVO> vo = sqlSession.selectList("com.hubba.mapper.HoursMapper.selectBusinessHours",idx); 
		return vo; 
	}

	@Override
	public void tempHours(List<HoursVO> list) {
		for(HoursVO temp: list) {
		sqlSession.insert("com.hubba.mapper.HoursMapper.tempHours",temp); 
		}
	}
	@Override
	public List<HoursVO> adminTempHours(){
		List<HoursVO> vo = sqlSession.selectList("com.hubba.mapper.HoursMapper.adminTemphours");
		return vo;
	}
	
	@Override
	public void adminHouredit(String open, String close, int business_idx, int days) {
		HoursVO vo = new HoursVO(); 
		vo.setBusiness_idx(business_idx);
		vo.setDays(days);
		vo.setOpen(open);
		vo.setClose(close);
		
		sqlSession.update("com.hubba.mapper.HoursMapper.adminHouredit",vo);
	}
	
	@Override
	public void deleteHourdelete(int idx) {
		sqlSession.delete("com.hubba.mapper.HoursMapper.adminHourdelete",idx);
		
	}
	
	//새봄 추가
	
	@Override
	   public List<HoursVO> selectToday(int business_idx, int today) {
	      Map<String, Integer> map = new HashMap<String, Integer>();
	      map.put("business_idx", business_idx);
	      map.put("today", today);
	      List<HoursVO> list = sqlSession.selectList("com.hubba.mapper.HoursMapper.selectToday", map);
	      
	      return list;
	   }
}
