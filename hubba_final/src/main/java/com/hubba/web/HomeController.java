package com.hubba.web;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.hubba.service.BookmarkService;
import com.hubba.service.BusinessService;
import com.hubba.service.HoursService;
import com.hubba.service.LikesService;
import com.hubba.service.MenuService;
import com.hubba.service.ReviewService;
import com.hubba.service.UsersService;
import com.hubba.vo.BusinessVO;
import com.hubba.vo.HoursVO;
import com.hubba.vo.LikesVO;
import com.hubba.vo.MenuVO;
import com.hubba.vo.MyReviewVO;
import com.hubba.vo.ReviewVO;
import com.hubba.vo.UsersVO;

@Controller
public class HomeController {

	@Autowired
	UsersService service_users;

	@Autowired
	BusinessService service_business;

	@Autowired
	BookmarkService service_bookmark;

	@Autowired
	ReviewService service_review;

	@Autowired // 서비스를 호출하기 위해서 의존성을 주입
	JavaMailSender mailSender;

	@Autowired
	BCryptPasswordEncoder pwEncoder;

	@Autowired
	HoursService service_hours;

	@Autowired
	MenuService service_menu;

	@Autowired
	ServletContext application;

	@Autowired
	LikesService service_likes;

	// 민희 추가
	@RequestMapping(value = "/", method = { RequestMethod.GET, RequestMethod.POST })
	public String home(Model model, HttpSession session, HttpServletRequest request) {

		session.invalidate();

		List<ReviewVO> review_list = service_review.selectNewReview();
		model.addAttribute("review_list", review_list);

		return "redirect:main";
	}

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String home2(HttpServletRequest request, Model model) {
		request.setAttribute("idx", "notLogin");

		HttpSession session = request.getSession(true);

		if (session.getAttribute("name") != null) {
			System.out.println("널값아님");
			model.addAttribute("name", session.getAttribute("name").toString());
			model.addAttribute("id", session.getAttribute("id").toString());
			model.addAttribute("profile_img", session.getAttribute("profile_img").toString());
			model.addAttribute("nameCompare", session.getAttribute("nameCompare").toString());
			request.setAttribute("nameCompare", session.getAttribute("nameCompare").toString());
			request.setAttribute("idx", session.getAttribute("idx").toString());

		}
		List<ReviewVO> review_list = service_review.selectNewReview();
		model.addAttribute("review_list", review_list);

		session.setAttribute("url", request.getHeader("referer"));

		return "main";
	}

	@RequestMapping(value = "/checkId", method = RequestMethod.POST)
	public @ResponseBody String AjaxViewId(@RequestParam("id") String id) {
		String str = "";
		int idcheck = service_users.idCheck(id);
		if (idcheck == 1) { // 이미 존재하는 계정
			str = "NO";
		} else { // 사용 가능한 계정
			str = "YES";
		}
		return str;
	}

	@RequestMapping(value = "/checkEmail", method = RequestMethod.POST)
	public @ResponseBody String AjaxViewEmail(@RequestParam("email") String email) {
		String str = "";
		int emailcheck = service_users.emailCheck(email);
		if (emailcheck == 1) {// 이미 존재하는 계정
			str = "NO";
		} else {// 사용 가능한 계정
			str = "YES";
		}
		return str;
	}

	// EmailSending 코드
	@RequestMapping(value = "/email_certify", method = RequestMethod.POST)
	public ModelAndView EmailSending(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws IOException {

		Random r = new Random();
		int dice = r.nextInt(4589362) + 49311; // 이메일로 받는 인증코드 부분 (난수)

		String Sender = "mh2232111@gamil.com";
		String Recipient = request.getParameter("email"); // 받는 사람 이메일
		String title = "hubba-hubba 회원가입 인증 이메일 입니다."; // 제목
		String content =

				System.getProperty("line.separator") + // 한줄씩 줄간격을 두기위해 작성

						System.getProperty("line.separator") +

						"안녕하세요 회원님 저희 hubba-hubba를 찾아주셔서 감사합니다"

						+ System.getProperty("line.separator") +

						System.getProperty("line.separator") +

						" 인증번호는 " + dice + " 입니다. "

						+ System.getProperty("line.separator") +

						System.getProperty("line.separator") +

						"받으신 인증번호를 홈페이지에 입력해주세요."; // 내용

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(Sender); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(Recipient); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

		ModelAndView mv = new ModelAndView(); // ModelAndView로 보낼 페이지를 지정하고, 보낼 값을 지정한다.
		mv.setViewName("/real_register2"); // 뷰의이름
		mv.addObject("dice", dice);

		System.out.println("mv : " + mv);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out_email = response.getWriter();
		out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
		out_email.flush();

		session.setAttribute("email", Recipient);

		return mv;

	}

	// 이메일로 받은 인증번호를 입력하고 전송 버튼을 누르면 맵핑되는 메소드.
	// 내가 입력한 인증번호와 메일로 입력한 인증번호가 맞는지 확인해서 맞으면 회원가입 페이지로 넘어가고,
	// 틀리면 다시 원래 페이지로 돌아오는 메소드
	@RequestMapping(value = "/diceCheck.do{dice}", method = RequestMethod.POST)
	public ModelAndView joinCertify(@RequestParam("email_certify") String email_certify, @PathVariable String dice,
			HttpServletResponse response, HttpSession session, Model model) throws IOException {

		System.out.println("사용자가 입력한 인증코드  : " + email_certify.trim());
		System.out.println("내가 보내준 인증코드  : " + dice);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("/registration2");

		if (email_certify.trim().equals(dice)) {// 인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 회원가입창으로 이동함

			mv.setViewName("/registration2");

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter write = response.getWriter();
			write.println("<script>alert('인증번호가 일치하였습니다. 회원가입창으로 이동합니다.');</script>");
			write.flush();

			model.addAttribute("email", session.getAttribute("email").toString());

			return mv;

		} else if (email_certify.trim() != dice) {

			ModelAndView mv2 = new ModelAndView();

			mv2.setViewName("/real_register2");

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter write = response.getWriter();
			write.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.');</script>");
			write.flush();

			model.addAttribute("email", session.getAttribute("email").toString());

			return mv2;

		}

		return mv;

	}

	@RequestMapping(value = "/afterRegister", method = RequestMethod.POST)
	public String afterRegister(@RequestParam("id") String id, @RequestParam("pw") String pw,
			@RequestParam("name") String name, HttpSession session) {
		System.out.println("입력한 아이디 : " + id);
		System.out.println("입력한 비밀번호 : " + pw);
		System.out.println("암호화 한 비밀번호 : " + pwEncoder.encode(pw));
		System.out.println("입력한 이름 : " + name);
		System.out.println("입력한 이메일 : " + session.getAttribute("email").toString());

		service_users.insertUsers(id, pwEncoder.encode(pw), name, session.getAttribute("email").toString());

		return "login";
	}

	@RequestMapping(value = "/login_Storage", method = RequestMethod.POST)
	public String loginStorage(@RequestParam("id") String id, @RequestParam("pw") String pw, HttpSession session,
			HttpServletResponse response, HttpServletRequest request) throws IOException {
		System.out.println("입력한 아이디 : " + id);
		System.out.println("입력한 비밀번호 : " + pw);

		if (service_users.idCheck(id) == 1) {
			System.out.println("아이디 존재");
			UsersVO uvo = service_users.pwCheck(id);
			boolean pwMatch = pwEncoder.matches(pw, uvo.getPw());

			if (pwMatch == true) {
				session.setAttribute("idx", uvo.getIdx());
				session.setAttribute("id", uvo.getId());
				session.setAttribute("name", uvo.getName());
				session.setAttribute("email", uvo.getEmail());
				session.setAttribute("profile_img", uvo.getProfile_img());
				session.setAttribute("nameCompare", service_users.userNameCompare(uvo.getId(), uvo.getEmail()));
				session.setAttribute("compare", uvo.getCompare());

				if (uvo.getCompare() == 1) {
					return "redirect:admin";
				}

				return "redirect:afterLogin";

			} else {

				response.setContentType("text/html; charset=UTF-8");
				PrintWriter write = response.getWriter();
				write.println("<script>alert('로그인 실패 , 비밀번호를 확인하세요');</script>");
				write.flush();

				return "login";
			}

		} else {

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter write = response.getWriter();
			write.println("<script>alert('로그인 실패 , 존재하지 않는 id입니다');</script>");
			write.flush();

			return "login";

		}
	}

	@RequestMapping(value = "/afterLogin", method = { RequestMethod.GET, RequestMethod.POST })
	public RedirectView afterLogin(HttpSession session, Model model, HttpServletRequest request) throws IOException {

		RedirectView redirectView = new RedirectView();
		if (session.getAttribute("url") == null) {
			redirectView.setUrl(
					request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + "/web");

			List<ReviewVO> review_list = service_review.selectNewReview();
			model.addAttribute("review_list", review_list);

		} else {
			redirectView.setUrl(session.getAttribute("url").toString());
			List<ReviewVO> review_list = service_review.selectNewReview();
			model.addAttribute("review_list", review_list);
		}

		return redirectView;

	}

	@RequestMapping(value = "/checkUserPw", method = RequestMethod.POST)
	public ModelAndView checkUserPw(@RequestParam("id") String id, @RequestParam("pw") String pw, HttpSession session,
			HttpServletRequest request, Model model, HttpServletResponse response) throws IOException {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("/real_editUsers2");

		UsersVO uvo = service_users.pwCheck(id);
		boolean pwMatch = pwEncoder.matches(pw, uvo.getPw());

		if (pwMatch == true) {

			model.addAttribute("profile_img", session.getAttribute("profile_img").toString());
			model.addAttribute("id", session.getAttribute("id").toString());
			model.addAttribute("email", session.getAttribute("email").toString());
			mv.setViewName("/real_editUsers2");

			response.setContentType("text/html; charset=UTF-8");

			return mv;

		} else {

			ModelAndView mv2 = new ModelAndView();
			mv2.setViewName("/real_editUsers");

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter write = response.getWriter();
			write.println("<script>alert('비밀번호가 틀렸습니다');</script>");
			write.flush();

			return mv2;
		}

	}

	@RequestMapping(value = "/logout")
	public ModelAndView logout(HttpSession session, HttpServletRequest request) {

		service_users.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:login");

		return mav;
	}

	@RequestMapping(value = "/register")
	public String register() {
		return "redirect:/login2";
	}

	@RequestMapping(value = "/registration")
	public String registration() {
		return "redirect:/login2";
	}

	@RequestMapping(value = "/login_btn")
	public String login() {
		// return "login";
		return "redirect:/login";

	}

	@RequestMapping(value = "/login_btn2")
	public String login2() {
		// return "login";
		return "redirect:/login";
	}

	@RequestMapping(value = "/findIdPw")
	public String findIdPw() {
		return "real_findIdPw";
	}

	@RequestMapping(value = "/editUser")
	public String editUser(HttpSession session, Model model) {
		String id = session.getAttribute("id").toString();
		model.addAttribute("id", id);
		return "real_editUsers";
	}

	@RequestMapping(value = "/addPlace")
	public String addPlace(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession(true);

		if (session.getAttribute("name") != null) {
			System.out.println("널값아님");
			model.addAttribute("name", session.getAttribute("name").toString());
			model.addAttribute("id", session.getAttribute("id").toString());
			model.addAttribute("profile_img", session.getAttribute("profile_img").toString());
			model.addAttribute("nameCompare", session.getAttribute("nameCompare").toString());
			request.setAttribute("nameCompare", session.getAttribute("nameCompare").toString());
		}
		return "addPlace";
	}

	@RequestMapping(value = "/addPlace_form", method = RequestMethod.POST)
	public String addPlace_form(@RequestParam("p_name") String p_name, @RequestParam("p_address") String p_address,
			@RequestParam("p_phone") String p_phone, @RequestParam("p_category") String p_category,
			@RequestParam("p_x") String p_x, @RequestParam("p_y") String p_y, Model model, HttpServletRequest request,
			HttpSession session) {

		System.out.println(p_name + "/" + p_address + "/" + p_phone + "/" + p_category + "/" + p_x + "/" + p_y);

		model.addAttribute("name", session.getAttribute("name").toString());
		model.addAttribute("id", session.getAttribute("id").toString());
		model.addAttribute("profile_img", session.getAttribute("profile_img").toString());
		model.addAttribute("nameCompare", session.getAttribute("nameCompare").toString());
		request.setAttribute("nameCompare", session.getAttribute("nameCompare").toString());

		service_business.insertTempPlace(p_name, p_address, p_phone, p_x, p_y, p_category);
		return "main";
	}

	@RequestMapping(value = "/adminInsertBusiness", method = RequestMethod.GET)
	public String adminInsertTempPlace(@RequestParam(value = "p_idx", required = true) String p_idx,
			@RequestParam(value = "p_name", required = true) String p_name,
			@RequestParam(value = "p_address", required = true) String p_address,
			@RequestParam(value = "p_phone", required = true) String p_phone,
			@RequestParam(value = "p_x", required = true) String p_x,
			@RequestParam(value = "p_y", required = true) String p_y,
			@RequestParam(value = "p_category", required = true) String p_category) {

		// service_menu.updateMenubyadmin(business_idx, menu_name, menu_price);
		// service_menu.deleteFromtheTemp(idx);
		service_business.insertBusiness(p_name, p_address, p_phone, p_x, p_y, p_category);
		service_business.deleteTempPlace(Integer.parseInt(p_idx));

		return "redirect:admin";
	}

	@RequestMapping(value = "/adminDeleteTempPlaceList", method = RequestMethod.GET)
	public String adminDeleteTempPlace(@RequestParam(value = "p_idx", required = true) String p_idx) {

		service_business.deleteTempPlace(Integer.parseInt(p_idx));
		return "redirect:admin";
	}

	@RequestMapping(value = "/findId", method = RequestMethod.POST)
	public String findId(@RequestParam("name") String name, @RequestParam("email") String email,
			HttpServletRequest request, Model model) {
		String str = "";
		System.out.println(name);
		System.out.println(email);
		int countFindId = service_users.countFindId(name, email);
		if (countFindId == 1) {
			String findId = service_users.findId(name, email);
			str = "가입하신 아이디는 " + findId + "입니다";
		} else {
			str = "가입된 아이디가 없습니다";
		}

		model.addAttribute("str", str);
		return "real_afterFindIdPw";
	}

	@RequestMapping(value = "/findPw", method = RequestMethod.POST)
	public String findId(@RequestParam("id") String id, @RequestParam("name") String name,
			@RequestParam("email") String email, HttpServletRequest request, Model model) {
		String str = "";
		System.out.println(id);
		System.out.println(name);
		System.out.println(email);
		int countFindPw = service_users.countFindPw(id, name, email);
		if (countFindPw == 1) {
			service_users.updatePw(pwEncoder.encode(service_users.sendPwCode(email)), email);
			str = "등록된 이메일로 임시 비밀번호를 전송해드렸습니다.";
		} else {
			str = "일치하는 가입자가 없습니다";
		}

		model.addAttribute("str", str);
		return "real_afterFindIdPw";
	}

	@RequestMapping(value = "/fileupload", method = RequestMethod.POST)
	public String fileUpload(HttpServletRequest req, HttpServletResponse rep, HttpSession session,
			@RequestParam("pw") String pw, @RequestParam("name") String name, Model model) {
		// 파일이 저장될 path 설정
		// String path = req.getSession().getServletContext().getRealPath("") +
		// "\\resources"; // 웹프로젝트 경로 위치
		try {
			req.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String path = req.getSession().getServletContext().getRealPath("/resources/img/");
//    	String filePath = application.getRealPath("resources/Upload/");

		System.out.println("path : " + path);

		Map returnObject = new HashMap();
		try {
			// MultipartHttpServletRequest 생성
			MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest) req;
			Iterator iter = mhsr.getFileNames();
			MultipartFile mfile = null;
			String fieldName = "";
			List resultList = new ArrayList();

			// 디레토리가 없다면 생성
			File dir = new File(path);
			if (!dir.isDirectory()) {
				dir.mkdirs();
			}

			// 값이 나올때까지
			while (iter.hasNext()) {
				fieldName = (String) iter.next(); // 내용을 가져와서
				mfile = mhsr.getFile(fieldName);
				String origName;
				// origName = new String(mfile.getOriginalFilename().getBytes("UTF-8"),
				// "8859_1"); //한글깨짐 방지
				origName = mfile.getOriginalFilename();

				System.out.println(mfile.getOriginalFilename());

				System.out.println("origName: " + origName);
				// 파일명이 없다면
				if ("".equals(origName)) {
					session.setAttribute("name", name);
					continue;
				}

				// 파일 명 변경(uuid로 암호화)
//                String ext = origName.substring(origName.lastIndexOf('.')); // 확장자 
//                String saveFileName = getUuid() + ext;
				String saveFileName = origName;

				System.out.println("saveFileName : " + saveFileName);
				session.setAttribute("name", name);
				session.setAttribute("profile_img", saveFileName);

				// 설정한 path에 파일저장
				File serverFile = new File(path + File.separator + saveFileName);
				mfile.transferTo(serverFile);

				Map file = new HashMap();
				file.put("origName", origName);
				file.put("sfile", serverFile);
				resultList.add(file);
			}

			returnObject.put("files", resultList);
			returnObject.put("params", mhsr.getParameterMap());
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalStateException e) { // TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) { // TODO Auto-generated catch block
			e.printStackTrace();
		}

		service_users.updateUsers(pwEncoder.encode(pw), name, session.getAttribute("profile_img").toString(),
				session.getAttribute("id").toString());
		model.addAttribute("id", session.getAttribute("id").toString());
		model.addAttribute("name", name);
		model.addAttribute("profile_img", session.getAttribute("profile_img").toString());

		req.setAttribute("nameCompare", session.getAttribute("nameCompare").toString());

		if (Integer.parseInt(session.getAttribute("compare").toString()) == 1) {
			return "admin";
		}

		return "main";

	}

	@RequestMapping(value = "/myBookmark")
	public String myBookmark(Model model, HttpServletRequest request, HttpSession session) {
		List<BusinessVO> list = service_business
				.bookmarkBusiness(Integer.parseInt(session.getAttribute("idx").toString()));
		request.setAttribute("idx", Integer.parseInt(session.getAttribute("idx").toString()));
		model.addAttribute("list", list);

		model.addAttribute("name", session.getAttribute("name").toString());
		model.addAttribute("id", session.getAttribute("id").toString());
		model.addAttribute("profile_img", session.getAttribute("profile_img").toString());
		model.addAttribute("nameCompare", session.getAttribute("nameCompare").toString());
		request.setAttribute("nameCompare", session.getAttribute("nameCompare").toString());
		// String path = request.getServletPath();
		// session.setAttribute("path",path.substring(1, path.length()));

		return "real_myBookmark";
	}

	@RequestMapping(value = "/deleteBookmark", method = RequestMethod.POST)
	public @ResponseBody String AjaxViewDB(@RequestParam("user_idx") String user_idx,
			@RequestParam("business_phone") String phone,
			@RequestParam("business_road_address_name") String road_address_name) {
		System.out.println(user_idx);
		System.out.println("삭제요!");
		System.out.println(user_idx);
		service_bookmark.deleteBookmark(Integer.parseInt(user_idx),
				service_business.businessIdx(phone, road_address_name));
		return "delete";
	}

	@RequestMapping(value = "/insertBookmark", method = RequestMethod.POST)
	public @ResponseBody String AjaxViewIB(@RequestParam("user_idx") String user_idx,
			@RequestParam("business_phone") String phone,
			@RequestParam("business_road_address_name") String road_address_name) {
		System.out.println("북마크요~!");
		System.out.println(user_idx);
		service_bookmark.insertBookmark(Integer.parseInt(user_idx),
				service_business.businessIdx(phone, road_address_name));
		return "insert";
	}

	@RequestMapping(value = "/myReview")
	public String myReview(Model model, HttpServletRequest request, HttpSession session) {

		List<MyReviewVO> list = service_review.myReviewList(Integer.parseInt(session.getAttribute("idx").toString()));
		request.setAttribute("user_idx", Integer.parseInt(session.getAttribute("idx").toString()));
		model.addAttribute("list", list);

		model.addAttribute("name", session.getAttribute("name").toString());
		model.addAttribute("id", session.getAttribute("id").toString());
		model.addAttribute("profile_img", session.getAttribute("profile_img").toString());
		model.addAttribute("nameCompare", session.getAttribute("nameCompare").toString());
		request.setAttribute("nameCompare", session.getAttribute("nameCompare").toString());
		// String path = request.getServletPath();
		// session.setAttribute("path",path.substring(1, path.length()));

		return "real_myReview";
	}

	@RequestMapping(value = "/deleteReview", method = RequestMethod.POST)
	public @ResponseBody String AjaxViewDR(@RequestParam("review_idx") String review_idx) {
		System.out.println("삭제요!");
		service_review.deleteMyReview(Integer.parseInt(review_idx));
		return "delete";
	}

	@RequestMapping(value = "/insertPlace", method = RequestMethod.POST)
	public @ResponseBody String AjaxViewIP(@RequestParam("p_name") String p_name,
			@RequestParam("p_address") String p_address, @RequestParam("p_phone") String p_phone,
			@RequestParam("p_category") String p_category, @RequestParam("p_x") String p_x,
			@RequestParam("p_y") String p_y) {

		service_business.insertBusiness(p_name, p_address, p_phone, p_x, p_y, p_category);
		// service_business.insertTempPlace(p_name, p_address, p_phone, p_x, p_y,
		// p_category);
		return "insert";
	}

	/*
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 도연추가!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 */

//	@RequestMapping(value = "/viewdetails", method = RequestMethod.GET)
//	public String viewdetails(Locale locale, Model model) {
//
//		return "viewDetails";
//	}

	@RequestMapping(value = "/category", method = RequestMethod.GET)
	public String category(Locale locale, Model model,
			@RequestParam(value = "category_group_name", required = true) String category_group_name,
			HttpServletRequest request) {
		System.out.println(category_group_name);

		String param = "";
		try {
			param = URLDecoder.decode(request.getParameter("category_group_name"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(param);
		List<BusinessVO> list = service_business.selectCategory(param);
		request.setAttribute("category_list", list);
		request.setAttribute("category_group_name", param);

		HttpSession session = request.getSession(true);

		if (session.getAttribute("name") != null) {
//			System.out.println("널값아님");
			model.addAttribute("name", session.getAttribute("name").toString());
			model.addAttribute("id", session.getAttribute("id").toString());
			model.addAttribute("profile_img", session.getAttribute("profile_img").toString());
			model.addAttribute("nameCompare", session.getAttribute("nameCompare").toString());
			request.setAttribute("nameCompare", session.getAttribute("nameCompare").toString());
		}

		// System.out.println(list.get(0).getX() + "" + list.get(0).getY());
		return "category";

	}

	@RequestMapping(value = "/json", method = RequestMethod.GET)
	@ResponseBody
	public List<BusinessVO> json(Locale locale, Model model,
			@RequestParam(value = "start", required = false) String start, HttpServletRequest request,
			@RequestParam(value = "category_group_name", required = false) String category_group_name) {
		Map categories = new HashMap();
		categories.put("start", Integer.parseInt(start));
		System.out.println("start : " + start);
		categories.put("category_group_name", category_group_name);
		List<BusinessVO> list = service_business.selectinfiniteloading(categories);

//		for(BusinessVO temp: list) {
//			System.out.println("json ajax : " + temp.getBusiness_idx());
//		}
		if (list.get(0) != null) {
			return list;
		}

		else {
			return null;
		}

	}
	
	@RequestMapping(value = "/categoryDetail", method = { RequestMethod.GET, RequestMethod.POST })
	public String json2(Locale locale, Model model, Integer idx, HttpServletRequest request, ReviewVO vo,
			LikesVO likesVo) {

		BusinessVO businessDetails = service_business.selectBusinessDetails(idx);
		List<HoursVO> BusinessHours = service_hours.selectBusinessHours(idx);
		List<MenuVO> businessMenu = service_menu.selectBusinessMenus(idx);
		String randomImages[] = service_review.randompicture(idx);

		String allImages[] = service_review.selectallpictures(idx);
		Calendar cal = Calendar.getInstance();
		int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
		System.out.println("today's day: " + dayOfWeek);
		request.setAttribute("dayOfWeek", dayOfWeek);
		request.setAttribute("allImagesSize", allImages.length);
		request.setAttribute("allImages", allImages);
		request.setAttribute("businessMenu", businessMenu);
		request.setAttribute("BusinessHours", BusinessHours);
		request.setAttribute("businessDetails", businessDetails);
		request.setAttribute("randomImages", randomImages);
		request.setAttribute("idx", "notLogin");
		request.setAttribute("checkBookmark", 2);
		request.setAttribute("nameCompare", "loginType");

		HttpSession session = request.getSession(true);
		int countReview = 0;
		if (session.getAttribute("name") != null) {
			request.setAttribute("idx", session.getAttribute("idx").toString());
			int user_idx = Integer.parseInt(session.getAttribute("idx").toString());
			// 총 리뷰 개수
			countReview = service_review.countAllReview(idx);

			model.addAttribute("user_idx", user_idx);
			model.addAttribute("review_count", countReview);
			model.addAttribute("name", session.getAttribute("name").toString());
			model.addAttribute("id", session.getAttribute("id").toString());
			model.addAttribute("profile_img", session.getAttribute("profile_img").toString());
			model.addAttribute("nameCompare", session.getAttribute("nameCompare").toString());
			request.setAttribute("nameCompare", session.getAttribute("nameCompare").toString());

			request.setAttribute("checkBookmark", service_bookmark.checkBookmark(user_idx, idx));
		}
		if (countReview != 0) {
			double rating_average = service_review.reviewAvg(idx);
			double average = Double.parseDouble(String.format("%.1f", rating_average));
			service_business.updateRating(idx, average);

		}
		model.addAttribute("business_idx", idx);

		return "viewDetails";
	}

	@RequestMapping(value = "/workingdays", method = RequestMethod.POST)
	public String editWorkingDays(@RequestParam(value = "open", required = true) String[] open,
			@RequestParam(value = "close", required = true) String[] close, Locale locale, Model model,
			int business_idx) {

		service_hours.edithours(open, close, business_idx);
		return "redirect:categoryDetail?idx=" + business_idx;
	}

	@RequestMapping(value = "/editmenu", method = RequestMethod.POST)
	public String editMenu(@RequestParam(value = "menu", required = true) String[] menu_name,
			@RequestParam(value = "price", required = true) int[] menu_price, Locale locale, Model model,
			int business_idx) {
		for (String temp : menu_name) {
			System.out.println(temp);
		}
		for (int temp : menu_price) {
			System.out.println(temp);
		}
		System.out.println(business_idx);
		service_menu.editMenu(menu_name, menu_price, business_idx);
		return "redirect:categoryDetail?idx=" + business_idx;
	}

	/* admin */
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin(Model model, HttpSession session) {
		List<MenuVO> TempMenu = service_menu.selectTempMenus();
		List<HoursVO> TempHours = service_hours.adminTempHours();
		List<BusinessVO> TempPlace = service_business.selectAllTempPlace();

		model.addAttribute("TempHours", TempHours);
		model.addAttribute("TempMenu", TempMenu);
		model.addAttribute("TempPlace", TempPlace);
		model.addAttribute("profile_img", session.getAttribute("profile_img").toString());

		return "admin";
	}

	@RequestMapping(value = "/adminMenuedit", method = RequestMethod.GET)
	public String adminMenueditConfirm(@RequestParam(value = "business_idx", required = true) int business_idx,
			@RequestParam(value = "menu_name", required = true) String menu_name,
			@RequestParam(value = "menu_price", required = true) int menu_price,
			@RequestParam(value = "idx", required = true) int idx) {
		service_menu.updateMenubyadmin(business_idx, menu_name, menu_price);
		service_menu.deleteFromtheTemp(idx);
		return "redirect:admin";
	}

	@RequestMapping(value = "/adminMenuDelete", method = RequestMethod.GET)
	public String adminMenuDelete(@RequestParam(value = "idx", required = true) int idx) {
		service_menu.deleteFromtheTemp(idx);
		// how to delete menu..? when the customer request?
		return "redirect:admin";
	}

	@RequestMapping(value = "/adminHouredit", method = RequestMethod.GET)
	public String adminHouredit(@RequestParam(value = "idx", required = true) int idx,
			@RequestParam(value = "business_idx", required = true) int business_idx,
			@RequestParam(value = "open", required = true) String open,
			@RequestParam(value = "close", required = true) String close,
			@RequestParam(value = "days", required = true) int days) {
		service_hours.adminHouredit(open, close, business_idx, days);
		service_hours.deleteHourdelete(idx);
		return "redirect:admin";
	}

	@RequestMapping(value = "/adminHourDelete", method = RequestMethod.GET)
	public String adminHourDelete(@RequestParam(value = "idx", required = true) int idx) {
		System.out.println(idx);
		service_hours.deleteHourdelete(idx);

		return "redirect:admin";
	}


}
