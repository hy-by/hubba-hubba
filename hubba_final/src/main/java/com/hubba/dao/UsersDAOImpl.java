package com.hubba.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.hubba.vo.UsersVO;

public class UsersDAOImpl implements UsersDAO {

	@Autowired
	private SqlSession sqlSession;

	//민희 추가
	
	@Override
	public int idCheck(String id) {
		return sqlSession.selectOne("com.hubba.mapper.UsersMapper.idCheck",id);
	}

	@Override
	public int emailCheck(String email) {
		return sqlSession.selectOne("com.hubba.mapper.UsersMapper.emailCheck",email);
	}

	@Override
	public void insertUsers(String id, String pw, String name, String email) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("name", name);
		map.put("email", email);
		map.put("pw", pw);
		sqlSession.insert("com.hubba.mapper.UsersMapper.insertUsers",map);
	}

	@Override
	public void insertSnsUsers(String id, String email,String profile_img) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("email", email);
		map.put("profile_img", profile_img);
		sqlSession.insert("com.hubba.mapper.UsersMapper.insertSnsUsers",map);
		// TODO Auto-generated method stub
		
	}

	@Override
	public UsersVO pwCheck(String id) {
		return sqlSession.selectOne("com.hubba.mapper.UsersMapper.pwCheck", id);
	}

	@Override
	public void logout(HttpSession session) {
		System.out.println("logout메서드 실행");
		
		session.invalidate();
	}
	

	@Override
	public int countFindId(String name, String email) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("email", email);
		return sqlSession.selectOne("com.hubba.mapper.UsersMapper.countFindId", map);
	}

	@Override
	public String findId(String name, String email) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("email", email);
		return sqlSession.selectOne("com.hubba.mapper.UsersMapper.findId", map);
	}

	@Override
	public int countFindPw(String id, String name, String email) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("name", name);
		map.put("email", email);
		return sqlSession.selectOne("com.hubba.mapper.UsersMapper.countFindPw", map);
	}
	
	@Override
	public void updatePw(String pw, String email) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("pw", pw);
		map.put("email",email);
		sqlSession.update("com.hubba.mapper.UsersMapper.updatePw", map);
		
	}

	@Override
	public void updateUsers(String pw, String name, String profile_img, String id) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("pw", pw);
		map.put("name",name);
		map.put("profile_img",profile_img);
		map.put("id",id);
		sqlSession.update("com.hubba.mapper.UsersMapper.updateUsers", map);
		
	}

	@Override
	public int userIdx(String id, String email) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("email", email);
		return sqlSession.selectOne("com.hubba.mapper.UsersMapper.userIdx", map);
	}

	@Override
	public String userNameCompare(String id, String email) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("email", email);
		return sqlSession.selectOne("com.hubba.mapper.UsersMapper.userNameCompare", map);
	}

	@Override
	public void updateSnsUsers(String profile_img, String id,String name) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("profile_img", profile_img);
		map.put("id", id);
		map.put("name", name);
		sqlSession.update("com.hubba.mapper.UsersMapper.updateSnsUsers", map);
	}

	
	//새봄추가
	@Override
	public List<UsersVO> selectAll(int idx) {
		List<UsersVO> list = sqlSession.selectList("com.hubba.mapper.UsersMapper.selectAll", idx);
		return list;
	}
	
	

	
	
	
}
