package com.hubba.vo;

public class BusinessVO {
	private int idx;
	private String place_name;
	private String road_address_name;
	private String phone;
	private String x;
	private String y;
	private String category_group_name;
	private float review_rating;
	private int vegan;
	private int vegetarian;
	private int kids;
	private int pet;
	private int smoking;
	private int wifi;
	private int mask;
	private int parking;
	private int delivery;
	private int take_out;
	private int reservation;
	private int business_idx;
	private String today;
	private String images;
	
	
	// 생성자

	public BusinessVO() {
		super();
	}

	public BusinessVO(String place_name, String road_address_name, String phone, String x, String y,
			String category_group_name, float review_rating) {
		super();
		this.place_name = place_name;
		this.road_address_name = road_address_name;
		this.phone = phone;
		this.x = x;
		this.y = y;
		this.category_group_name = category_group_name;
		this.review_rating = review_rating;
	}

	// getter setter
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

	public int getVegan() {
		return vegan;
	}

	public void setVegan(int vegan) {
		this.vegan = vegan;
	}

	public int getVegetarian() {
		return vegetarian;
	}

	public void setVegetarian(int vegetarian) {
		this.vegetarian = vegetarian;
	}

	public int getKids() {
		return kids;
	}

	public void setKids(int kids) {
		this.kids = kids;
	}

	public int getPet() {
		return pet;
	}

	public void setPet(int pet) {
		this.pet = pet;
	}

	public int getSmoking() {
		return smoking;
	}

	public void setSmoking(int smoking) {
		this.smoking = smoking;
	}

	public int getWifi() {
		return wifi;
	}

	public void setWifi(int wifi) {
		this.wifi = wifi;
	}

	public int getMask() {
		return mask;
	}

	public void setMask(int mask) {
		this.mask = mask;
	}

	public int getParking() {
		return parking;
	}

	public void setParking(int parking) {
		this.parking = parking;
	}

	public int getDelivery() {
		return delivery;
	}

	public void setDelivery(int delivery) {
		this.delivery = delivery;
	}

	public int getTake_out() {
		return take_out;
	}

	public void setTake_out(int take_out) {
		this.take_out = take_out;
	}

	public int getReservation() {
		return reservation;
	}

	public void setReservation(int reservation) {
		this.reservation = reservation;
	}

	public int getBusiness_idx() {
		return business_idx;
	}

	public void setBusiness_idx(int business_idx) {
		this.business_idx = business_idx;
	}

	public String getToday() {
		return today;
	}

	public void setToday(String today) {
		this.today = today;
	}

	public String getImages() {
		return images;
	}

	public void setImages(String images) {
		this.images = images;
	}

}
