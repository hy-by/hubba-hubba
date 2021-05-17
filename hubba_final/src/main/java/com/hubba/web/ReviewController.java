package com.hubba.web;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hubba.service.BusinessService;
import com.hubba.service.HoursService;
import com.hubba.service.LikesService;
import com.hubba.service.ReviewService;
import com.hubba.service.UsersService;
import com.hubba.vo.BusinessVO;
import com.hubba.vo.HoursVO;
import com.hubba.vo.LikesVO;
import com.hubba.vo.ReviewVO;
import com.hubba.vo.UsersVO;

@Controller
public class ReviewController {
	
	@Autowired
	UsersService service_users;
	
	@Autowired
	BusinessService service_business;
	
	@Autowired
	HoursService service_hours;
	
	@Autowired
	ReviewService service_review;
	
	@Autowired
	LikesService service_likes;
	
	@RequestMapping(value = "/header", method = { RequestMethod.POST, RequestMethod.GET })
	public String head() {
		return "header_main";
	}
	
	@RequestMapping(value = "/search_storage")
	public String searchStorage(String keyword, String x, String y, HttpSession session) {
		/*
		 * 2020_0502 : 구글 api를 이용해 검색한 주소의 위도, 경도 가져와서 afterSearch 페이지로 값 넘겨주기
		 * param: keyword: 검색어, x: 경도, y: 위도
		 * return: afterSearch 페이지의 url로 redirect
		 * */
		session.setAttribute("keyword", keyword);
		session.setAttribute("x", x);
		session.setAttribute("y", y);
		return "redirect:search";
	}
	
	// 검색 후 페이지
	@RequestMapping(value = "/search")
	public String searchPage(Model model, HttpServletRequest request) {
		/*
		 * 2020_0503 : 카카오 map api를 이용해 검색 키워드와 좌표(위도,경도)에 맞는 가게 list로 출력
		 * return: 검색 결과에 맞는 business list와 검색어, 위도, 경도 값 담아 afterSearch 페이지로 return
		 */

		HttpSession session = request.getSession(true);

		if (session.getAttribute("name") != null) {
			System.out.println("널값아님");
			model.addAttribute("name", session.getAttribute("name").toString());
			model.addAttribute("id", session.getAttribute("id").toString());
			model.addAttribute("profile_img", session.getAttribute("profile_img").toString());
			model.addAttribute("nameCompare", session.getAttribute("nameCompare").toString());
			request.setAttribute("nameCompare", session.getAttribute("nameCompare").toString());
		}

		String keyword2 = session.getAttribute("keyword").toString();
		String keyword = keyword2.replaceAll(" ", "");
		//System.out.println(keyword);

		if (keyword.equals("코인노래방")) {
			keyword = "코노";
		}

		String x = session.getAttribute("x").toString();
		String y = session.getAttribute("y").toString();
		//System.out.println("좌표 >> " + x + "," + y);
		
		List<BusinessVO> list = service_business.getBusinessInfo(keyword, x, y);

		Calendar cal = Calendar.getInstance();
		int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
		String today = "";
		String images = "";
		for (BusinessVO b : list) {
			List<HoursVO> hour_list = service_hours.selectToday(b.getIdx(), dayOfWeek);
			images = service_business.getReviewImage(b.getIdx());
			b.setImages(images);

			for (HoursVO h : hour_list) {
				today = h.getOpen() + " - " + h.getClose();
				b.setToday(today);
			}
		}

		model.addAttribute("list", list);
		model.addAttribute("keyword", keyword);
		// y값
		model.addAttribute("latitude", y);
		// x값
		model.addAttribute("longitude", x);

		return "afterSearch";
	}
	
	@ResponseBody
	@PostMapping(value = "/insertReview")
	public Map<String, Object> insertReview(HttpServletRequest req, ReviewVO vo) throws Exception {
		/*
		 * 2020_0516 : 새 댓글 추가(ajax)
		 * param : vo: ReviewVo, content: 리뷰 내용, rating: 별점, user_idx: 사용자 idx, business_idx: 가게 idx
		 * return: 새 댓글에 필요한 요소들 map에 담아 return
		 */
		Map<String, Object> map = new HashMap<String, Object>();
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) req;
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date time = new Date();

		String content = multipartRequest.getParameter("content");
		System.out.println("내용 >> " + content);
		int rating = Integer.parseInt(multipartRequest.getParameter("rating"));
		System.out.println("별점 >> " + rating);
		int user_idx = Integer.parseInt(multipartRequest.getParameter("user_idx"));
		int business_idx = Integer.parseInt(multipartRequest.getParameter("business_idx"));
		String imagesStr = "";
		String id = "";
		String profile_img = "";
		String date = format.format(time);
		
		// 사용자의 프로필 이미지 가져오는 코드
		List<UsersVO> user_list = service_users.selectAll(user_idx);
		for (UsersVO u : user_list) {
			id = u.getId();
			profile_img = u.getProfile_img();
		}

		String filepath = req.getSession().getServletContext().getRealPath("resources/img/");

		List<MultipartFile> fileList = multipartRequest.getFiles("multiparts");
		String filename = "";
		for (MultipartFile mf : fileList) {
			if (mf.isEmpty() == false) {
				filename = mf.getOriginalFilename();

				File file = new File(filepath, filename);

				if (file.exists() == false) {
					file.mkdirs();
				}
				mf.transferTo(file);

				imagesStr += filename + "&";
			}
		}
		// 리뷰의 내용이 없거나 별점을 선택하지 않은 경우 error message를 map에 put
		String contentError = "";
		int ratingError = 0;
		String images = "";
		// 내용 미입력시
		if(content.equals("")) {
			contentError = "empty";
			map.put("contentError", contentError);
		}
		// 별점 미선택시
		if(rating == 0) {
			ratingError = -1;
			map.put("ratingError", ratingError);
		}

		if(!content.equals("") && rating != 0){
			if (imagesStr.equals("")) {
				vo.setImages(null);
				service_review.insertReview(vo);
			} else {
				images = imagesStr.substring(0, imagesStr.length() - 1);
				vo.setImages(images);
				service_review.insertReview(vo);
			}
		}
		
		int countReview = service_review.countAllReview(business_idx);
		double rating_average = service_review.reviewAvg(business_idx);
		double average = Double.parseDouble(String.format("%.1f", rating_average));
		service_business.updateRating(business_idx, average);

		map.put("user_idx", user_idx);
		map.put("business_idx", business_idx);
		map.put("rating", rating);
		map.put("images", images);
		map.put("content", content);
		map.put("date", date);
		map.put("id", id);
		map.put("profile_img", profile_img);
		map.put("review_count", countReview);

		return map;

	}
	 
	@ResponseBody
	@PostMapping(value = "/orderReply")
	public Map<String, Object> orderReply(HttpServletRequest req, Model model) {
		/*
		 * 2021_0420 : 댓글 정렬(최신순-기본, 좋아요순) 추가(ajax)
		 * 2021_0423 : 댓글 내 좋아요 표시 하기 위해 LikesVO 추가
		 * 2021_0430 : 페이징 처리 위해 mapper, dao, service, ajax 코드 변경 후 pagination 추가
		 * 2021_0503 : pagination의 prev, next 작동 코드 추가 및 기존 페이징 코드 수정
		 * param : radio_type: 라디오버튼 value, business_idx: 가게의 idx, user_idx: 사용자 idx, startPageNum: 리뷰 페이지 숫자
		 * return : review_list와 review의 총 개수 map으로 return
		 */
		
		List<ReviewVO> list = new ArrayList<ReviewVO>();
		Map<String, Object> map = new HashMap<String, Object>();
		String radio_type = req.getParameter("radio_val");
		int business_idx = Integer.parseInt(req.getParameter("business_idx"));
		int user_idx = Integer.parseInt(req.getParameter("user_idx"));
		int startPageNum = Integer.parseInt(req.getParameter("startNum"));
		// 현재 페이지 다시 넘겨주기
		map.put("startNum", startPageNum);
		// 리뷰의 limit count
		int endNum = 10;
		
		// 총 댓글 수
		int all_review_count = service_review.countAllReview(business_idx);

		// 마지막 페이지 num 구하기
		int last_page_num = (int)Math.ceil((float)all_review_count / endNum);
		// 리뷰바 블럭 값(size=5)
		int block_size = 5;
		// 블럭의 index
		int block_idx = (startPageNum - 1) / block_size;
		int block_start = (block_idx * block_size) + 1;
		int block_end = block_start + (block_size - 1);
		
		// start_index 구하기 
		// ex) startPageNum = 2로 넘겨 받았을 경우, mapper에는 10으로 넘겨야 함 --> (2-1)*10 = 10
		if ("latest_likes".equals(radio_type)) {
			startPageNum = (startPageNum - 1) * endNum;
			list = service_review.orderByLatestReview(business_idx, startPageNum, endNum);
		} else if ("popular_likes".equals(radio_type)) {
			startPageNum = (startPageNum - 1) * endNum;
			list = service_review.orderByPopularReview(business_idx, startPageNum, endNum);
		}

		// 좋아요 체크 유무 표시
		List<LikesVO> likes_list = service_likes.selectAll(business_idx);
		int count = 0;
		int like_review_idx = 0;
		for (LikesVO like : likes_list) {
			like_review_idx = like.getReview_idx();
			for (ReviewVO v : list) {
				if (like_review_idx == v.getIdx()) {
					count = service_likes.showLikes(business_idx, user_idx, v.getIdx());
					v.setLikes(count);
				}
			}
		}
		
		map.put("review", list);
		map.put("lastPageNum", last_page_num);
		map.put("blockStart", block_start);
		map.put("blockEnd", block_end);
		

		return map;

	}
	
	@ResponseBody
	@RequestMapping("/likes")
	public Map<String, Integer> checkLikes(HttpServletRequest req, LikesVO vo) {
		/*
		 * 2020_0520 : 좋아요 / 취소 기능 추가 (ajax)
		 * 2021_0420: 좋아요 취소시 count 차감이 아니라 0으로 변하는 오류 수정
		 * param : vo: LikesVO, user_idx: 사용자 idx, business_idx: 가게의 idx, review_idx: 좋아요 누른 리뷰의 idx, value: 좋아요 유무 (1(좋아요), 0(취소))
		 * return : param 값들을 map에 담아 return
		 */
		Map<String, Integer> map = new HashMap<String, Integer>();
		int user_idx = Integer.parseInt(req.getParameter("user_idx"));
		int business_idx = Integer.parseInt(req.getParameter("business_idx"));
		int review_idx = Integer.parseInt(req.getParameter("review_idx"));
		int value = Integer.parseInt(req.getParameter("value"));

		if (value == 1) {
			// 좋아요 누름
			service_likes.checkedLikes(vo);
			int totalLikes = service_likes.countLikes(business_idx, review_idx);
			service_review.updateLikes(business_idx, review_idx, totalLikes);
			map.put("review_rating", totalLikes);
		} else if (value == 0) {
			// 좋아요 취소
			service_likes.uncheckedLikes(business_idx, user_idx, review_idx);
			int totalLikes = service_likes.countLikes(business_idx, review_idx);
			service_review.updateLikes(business_idx, review_idx, totalLikes);
			map.put("review_rating", totalLikes);
		}
		map.put("user_idx", user_idx);
		map.put("business_idx", business_idx);
		map.put("review_idx", review_idx);
		map.put("value", value);

		return map;
	}
}
