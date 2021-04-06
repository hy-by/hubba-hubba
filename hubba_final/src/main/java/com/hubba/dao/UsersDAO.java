package com.hubba.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.hubba.vo.UsersVO;

public interface UsersDAO {

	//민희 추가 
	public int idCheck(String id);
	public int emailCheck(String email);
	public void insertUsers(String id, String pw, String name, String email);
	public void insertSnsUsers(String id, String email,String profile_img);
	public UsersVO pwCheck(String id);
	public void logout(HttpSession session);
	public int countFindId(String name, String email);
	public String findId(String name, String email);
	public int countFindPw(String id, String name, String email);
	public void updatePw(String pw, String email);
	public void updateUsers(String pw, String name,String profile_img,String id);
	public int userIdx(String id, String email);
	public String userNameCompare(String id, String email);
	public void updateSnsUsers(String profile_img,String id,String name);
	
	//새봄추가
	public List<UsersVO> selectAll(int idx);
	
}
