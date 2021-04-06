package com.hubba.vo;

public class HoursVO {

	private int idx;
	private int business_idx;
	private String open;
	private String close;
	private String holiday;
	private int days;
	private String place_name;
	private String day_kr;

	public String getDay_kr() {
		return day_kr;
	}

	public void setDay_kr(String day_kr) {
		this.day_kr = day_kr;
	}

	// getter setter
	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getBusiness_idx() {
		return business_idx;
	}

	public void setBusiness_idx(int business_idx) {
		this.business_idx = business_idx;
	}

	public String getOpen() {
		return open;
	}

	public void setOpen(String open) {
		this.open = open;
	}

	public String getClose() {
		return close;
	}

	public void setClose(String close) {
		this.close = close;
	}

	public String getHoliday() {
		return holiday;
	}

	public void setHoliday(String holiday) {
		this.holiday = holiday;
	}

	public String getPlace_name() {
		return place_name;
	}

	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}

	public int getDays() {
		return days;
	}

	public void setDays(int days) {
		this.days = days;
	}

	//
	public HoursVO() {
		super();
	}

}