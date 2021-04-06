package com.hubba.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.hubba.Login.KakaoLoginService;
import com.hubba.Login.NaverLoginService;
import com.hubba.service.ReviewService;
import com.hubba.service.UsersService;
import com.hubba.vo.ReviewVO;


@Controller
public class LoginController {
	
	@Autowired
	NaverLoginService service_naver;
	
	@Autowired
	UsersService service_users;
	
	@Autowired
	KakaoLoginService service_kakao;
	
	@Autowired
	ReviewService service_review;
	

	
	  @Autowired
	  private GoogleConnectionFactory googleConnectionFactory;
	
	  @Autowired
	  private OAuth2Parameters googleOAuth2Parameters;


    




	private String apiResult = null;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView memberLoginForm(HttpSession session,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		session.setAttribute("url", request.getHeader("referer"));
		System.out.println(request.getHeader("referer"));
		
		/* 네아로 인증 URL을 생성하기 위하여 getAuthorizationUrl을 호출 */
		String naverAuthUrl = service_naver.getAuthorizationUrl(session);
		String kakaoUrl = service_kakao.getAuthorizationUrl(session);

		/* 구글code 발행 */
	  	OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();

	    /* 로그인페이지 이동 url생성 */
	  	String googleUrl = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);


		
		/* 생성한 인증 URL을 View로 전달 */
		//mav.setViewName("real_login");
		mav.setViewName("login");
		// 네이버 로그인
		mav.addObject("naver_url", naverAuthUrl);
		// 카카오 로그인
		mav.addObject("kakao_url", kakaoUrl);
		//구글 로그인
		mav.addObject("google_url",googleUrl);

	
		return mav;
	}// end memberLoginForm()
	
	@RequestMapping(value = "/login2", method = RequestMethod.GET)
	public ModelAndView memberLoginForm2(HttpSession session,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		session.setAttribute("url", request.getHeader("referer"));
		System.out.println(request.getHeader("referer"));
		
		/* 네아로 인증 URL을 생성하기 위하여 getAuthorizationUrl을 호출 */
		String naverAuthUrl = service_naver.getAuthorizationUrl(session);
		String kakaoUrl = service_kakao.getAuthorizationUrl(session);

		/* 구글code 발행 */
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String googleUrl = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);


		
		/* 생성한 인증 URL을 View로 전달 */
		//mav.setViewName("real_login");
		mav.setViewName("registration");
		// 네이버 로그인
		mav.addObject("naver_url", naverAuthUrl);
		// 카카오 로그인
		mav.addObject("kakao_url", kakaoUrl);
		//구글 로그인
		mav.addObject("google_url",googleUrl);

	
		return mav;
	}// end memberLoginForm()
	

	
	
	@RequestMapping(value = "/callback_naver",  produces = "application/json;charset=utf-8", method = { RequestMethod.GET, RequestMethod.POST })
	public String naverLogin(@RequestParam String code, @RequestParam String state, HttpSession session,
			 Model model) throws IOException{
		
		OAuth2AccessToken oauthToken;
		oauthToken = service_naver.getAccessToken(session, code, state);
		
		// 로그인한 사용자의 모든 정보가 JSON타입으로 저장되어 있음
		apiResult = service_naver.getUserProfile(oauthToken);
		
		// 내가 원하는 정보 (이름)만 JSON타입에서 String타입으로 바꿔 가져오기 위한 작업
		JSONParser parser = new JSONParser();
		Object obj = null;
		try {
			obj = parser.parse(apiResult);
		} catch (ParseException e) {
			e.printStackTrace();
		}		
		
		
		JSONObject jsonobj = (JSONObject) obj;
		JSONObject response = (JSONObject) jsonobj.get("response");
		
		String nname = (String) response.get("name");
		String nemail = (String) response.get("email");
		String nimage = (String) response.get("profile_image");
		String[] arr = nemail.split("@");
		String nid = arr[0];
		
		if(service_users.emailCheck(nemail)==0) {
			service_users.insertSnsUsers(nid, nemail,nimage);
		}else {
			//업데이트
			service_users.updateSnsUsers(nimage, nid, "sns_login");
		}
		
		
		
		
		// 로그인&아웃 하기위한 세션값 주기
		session.setAttribute("idx", service_users.userIdx(nid, nemail));
		session.setAttribute("id", nid);
		session.setAttribute("name", nname);
		session.setAttribute("email", nemail);
		session.setAttribute("profile_img", nimage);
		session.setAttribute("nameCompare", service_users.userNameCompare(nid, nemail));
		
		return "redirect:snsLogin";
	}// end NaverLogin()
	
	
	
	@RequestMapping(value = "/callback_kakao", produces = "application/json", method = { RequestMethod.GET,RequestMethod.POST })
	public String kakaoLogin(@RequestParam("code") String code, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		// 결과값을 node에 담아줌
		JsonNode node = service_kakao.getAccessToken(code);
		// accessToken에 사용자의 로그인한 모든 정보가 들어있음
		JsonNode accessToken = node.get("access_token");
		// 사용자의 정보
		JsonNode userInfo = service_kakao.getKakaoUserInfo(accessToken);
		String kemail = null;
		String kname = null;
		String kimage = null;
		String kid = null;
		JsonNode kprofile = null;
		// 유저정보 카카오에서 가져오기 Get properties
		JsonNode properties = userInfo.path("properties");
		JsonNode kakao_account = userInfo.path("kakao_account");
		kemail = kakao_account.path("email").asText();
		kname = properties.path("nickname").asText();
		kprofile = kakao_account.path("profile");
		kimage = kprofile.path("profile_image_url").asText();
		String[] arr = kemail.split("@");
		kid = arr[0];

		
		if(kimage.equals("")) {
			kimage = "resources/img/logo_1.png";
		}

		if(service_users.emailCheck(kemail)==0) {
			service_users.insertSnsUsers(kid, kemail,kimage);
		}else {
			//업데이트
			service_users.updateSnsUsers(kimage, kid, "sns_login");
		}
		
		
		
		// 로그인&아웃 하기위한 세션값 주기
		session.setAttribute("idx", service_users.userIdx(kid, kemail));
		session.setAttribute("id", kid);
		session.setAttribute("name", kname);
		session.setAttribute("email", kemail);
		session.setAttribute("profile_img", kimage);
		session.setAttribute("nameCompare", service_users.userNameCompare(kid, kemail));
	
		return "redirect:snsLogin";
		
	}// end kakaoLogin()
	



	@RequestMapping(value = "/callback_google", method = { RequestMethod.GET, RequestMethod.POST })
	public String googleCallback(Model model, @RequestParam String code) throws IOException {
		System.out.println("여기는 googleCallback");

		return "main";
	}// end googleLogin()




	@RequestMapping(value = "/snsLogin", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView after_SnsLogin(HttpSession session, Model model,HttpServletRequest request) throws IOException {
		
		ModelAndView mav = new ModelAndView();
		
		System.out.println(session.getAttribute("profile_img").toString());
		
		model.addAttribute("name", session.getAttribute("name").toString());
		model.addAttribute("id", session.getAttribute("id").toString());
		model.addAttribute("profile_img", session.getAttribute("profile_img").toString());
		model.addAttribute("nameCompare", session.getAttribute("nameCompare").toString());
		request.setAttribute("nameCompare", session.getAttribute("nameCompare").toString());
		
		List<ReviewVO> review_list = service_review.selectNewReview();
		model.addAttribute("review_list", review_list);
		// 네이버 로그인 성공 페이지 View 호출
		//mav.setViewName("real_afterLoginIndex");
		mav.setViewName("main");
		
		return mav;
		}// end naverLogin()




}
