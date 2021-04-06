package com.hubba.service;

import java.util.List;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.hubba.dao.UsersDAOImpl;
import com.hubba.vo.UsersVO;

@Service
public class UsersServiceImpl implements UsersService {

	@Autowired
	UsersDAOImpl dao;
	
	@Autowired    //서비스를 호출하기 위해서 의존성을 주입
    JavaMailSender mailSender;

	//민희 추가
	@Override
	public int idCheck(String id) {
		return dao.idCheck(id);
	}

	@Override
	public int emailCheck(String email) {
		return dao.emailCheck(email);
	}

	@Override
	public void insertUsers(String id, String pw, String name, String email) {
		dao.insertUsers(id, pw, name, email);
	}
	
	

	@Override
	public void insertSnsUsers(String id, String email, String profile_img) {
		dao.insertSnsUsers(id, email,profile_img);
	}

	@Override
	public UsersVO pwCheck(String id) {
		return dao.pwCheck(id);
	}

	@Override
	public void logout(HttpSession session) {
		dao.logout(session);
		
	}
	
	@Override
	public int countFindId(String name, String email) {
		return dao.countFindId(name, email);
	}

	@Override
	public String findId(String name, String email) {
		return dao.findId(name, email);
	}

	@Override
	public int countFindPw(String id, String name, String email) {
		return dao.countFindPw(id, name, email);
	}
	
	@Override
	public void updatePw(String pw, String email) {
		dao.updatePw(pw, email);
	}
	

	@Override
	public String sendPwCode(String email) {
		String random = UUID.randomUUID().toString().replaceAll("-", ""); // -를 제거해 주었다.
		random = random.substring(0, 10); //uuid를 앞에서부터 10자리 잘라줌.
        System.out.println("임시비밀번호123 : " + random);
        
        String Sender = "mh2232111@gamil.com"; // 받는 사람 이메일
        String title = "hubba-hubba 임시비밀번호 입니다"; // 제목
        String content =
        
        System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
        
        System.getProperty("line.separator")+
                
        "안녕하세요 회원님 저희 hubba-hubba를 찾아주셔서 감사합니다"
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+

        " 임시 비밀번호는  " +random+ " 입니다. "
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+
        
        "임시 비밀번호로 로그인 한 후 비밀번호를 재설정 해주세요."; // 내용
        
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message,
                    true, "UTF-8");

            messageHelper.setFrom(Sender); // 보내는사람 생략하면 정상작동을 안함
            messageHelper.setTo(email); // 받는사람 이메일
            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
            messageHelper.setText(content); // 메일 내용
            
            mailSender.send(message);
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return random;
	}

	@Override
	public void updateUsers(String pw, String name, String profile_img, String id) {
		dao.updateUsers(pw, name, profile_img, id);
		
	}

	@Override
	public int userIdx(String id,String email) {
		return dao.userIdx(id, email);
	}

	@Override
	public String userNameCompare(String id, String email) {
		return dao.userNameCompare(id, email);
	}
	
	@Override
	public void updateSnsUsers(String profile_img, String id,String name) {
		dao.updateSnsUsers(profile_img, id,name);
	}
	
	
	
	// 새봄추가

	@Override
	public List<UsersVO> selectAll(int idx) {
		List<UsersVO> list = dao.selectAll(idx);
		return list;
	}
	
	
}
