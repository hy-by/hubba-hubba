package com.hubba.service;

public interface BookmarkService {

	public void deleteBookmark(int user_idx,int business_idx);
	public void insertBookmark(int user_idx,int business_idx);
	
	//민희 0514 추가
	public int checkBookmark(int user_idx, int business_idx);
}
