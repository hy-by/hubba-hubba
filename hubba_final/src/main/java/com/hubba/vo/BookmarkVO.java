package com.hubba.vo;

public class BookmarkVO {

	private int idx;
	private int user_idx;
	private int business_idx;

	// 생성자
	public BookmarkVO() {
		super();
	}

	// getter setter
	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public int getBusiness_idx() {
		return business_idx;
	}

	public void setBusiness_idx(int business_idx) {
		this.business_idx = business_idx;
	}

}
