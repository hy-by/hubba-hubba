package com.hubba.vo;

import org.springframework.web.multipart.MultipartFile;

public class ReviewVO {

	private int idx;
	private int user_idx;
	private int business_idx;
	private int rating;
	private int likes;
	private String content;
	private String date;
	private String images;
	private MultipartFile[] multipart;
	private String id;
	private String profile_img;
	private String[] filenames;
	private int total_likes;
	private String place_name;
	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

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

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getImages() {
		return images;
	}

	public void setImages(String images) {
		this.images = images;
	}

	public MultipartFile[] getMultipart() {
		return multipart;
	}

	public void setMultipart(MultipartFile[] multipart) {
		this.multipart = multipart;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getProfile_img() {
		return profile_img;
	}

	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}

	public String[] getFilenames() {
		return filenames;
	}

	public void setFilenames(String[] filenames) {
		this.filenames = filenames;
	}

	public int getTotal_likes() {
		return total_likes;
	}

	public void setTotal_likes(int total_likes) {
		this.total_likes = total_likes;
	}

	public String getPlace_name() {
		return place_name;
	}

	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}

	

}
