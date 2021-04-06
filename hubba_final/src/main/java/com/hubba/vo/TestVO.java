package com.hubba.vo;

public class TestVO {
	
	private int idx;
	private String place_name;
	private String road_address_name;
	private String phone;
	private String x;
	private String y;
	private String category_group_name;
	private float review_rating;
	private String images;
	
	public TestVO(int idx, String place_name, String road_address_name, String phone, String x, String y,
			String category_group_name, float review_rating, String images) {
		super();
		this.idx = idx;
		this.place_name = place_name;
		this.road_address_name = road_address_name;
		this.phone = phone;
		this.x = x;
		this.y = y;
		this.category_group_name = category_group_name;
		this.review_rating = review_rating;
		this.images = images;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getPlace_name() {
		return place_name;
	}
	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}
	public String getRoad_address_name() {
		return road_address_name;
	}
	public void setRoad_address_name(String road_address_name) {
		this.road_address_name = road_address_name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getX() {
		return x;
	}
	public void setX(String x) {
		this.x = x;
	}
	public String getY() {
		return y;
	}
	public void setY(String y) {
		this.y = y;
	}
	public String getCategory_group_name() {
		return category_group_name;
	}
	public void setCategory_group_name(String category_group_name) {
		this.category_group_name = category_group_name;
	}
	public float getReview_rating() {
		return review_rating;
	}
	public void setReview_rating(float review_rating) {
		this.review_rating = review_rating;
	}
	public String getImages() {
		return images;
	}
	public void setImages(String images) {
		this.images = images;
	}
	
	
	
	
	
	
	
	

}
