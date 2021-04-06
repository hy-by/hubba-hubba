package com.hubba.vo;

public class MyReviewVO {

	private int idx;
	private int business_idx;
	private String place_name;
	private int rating;
	private String date;
	private String content;
	private String images;
	private int total_likes;

	private String road_address_name;

	public MyReviewVO() {
		super();
	}

	public MyReviewVO(int idx, int business_idx, String place_name, int rating, String date, String content,
			String images, int total_likes, String road_address_name) {
		super();
		this.idx = idx;
		this.business_idx = business_idx;
		this.place_name = place_name;
		this.rating = rating;
		this.date = date;
		this.content = content;
		this.images = images;
		this.total_likes = total_likes;
		this.road_address_name = road_address_name;
	}

	public String getPlace_name() {
		return place_name;
	}

	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImages() {
		return images;
	}

	public void setImages(String images) {
		this.images = images;
	}

	public int getTotal_likes() {
		return total_likes;
	}

	public void setTotal_likes(int total_likes) {
		this.total_likes = total_likes;
	}

	public String getRoad_address_name() {
		return road_address_name;
	}

	public void setRoad_address_name(String road_address_name) {
		this.road_address_name = road_address_name;
	}

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

}
