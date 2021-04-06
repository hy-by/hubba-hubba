package com.hubba.vo;

public class MenuVO {

	private int idx;
	private int business_idx;
	private String menu_name;
	private int menu_price;
	private String place_name;

	public String getPlace_name() {
		return place_name;
	}

	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}

	public MenuVO() {
		super();
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

	public String getMenu_name() {
		return menu_name;
	}

	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}

	public int getMenu_price() {
		return menu_price;
	}

	public void setMenu_price(int menu_price) {
		this.menu_price = menu_price;
	}

}
