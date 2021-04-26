package com.hubba.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.io.File;
import com.hubba.dao.BusinessDAOImpl;
import com.hubba.dao.ReviewDAOImpl;
import com.hubba.vo.MyReviewVO;
import com.hubba.vo.ReviewVO;
import java.io.IOException;
import javax.servlet.ServletContext;

import com.hubba.dao.ReviewDAO;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewDAOImpl dao;

	@Autowired
	BusinessDAOImpl dao_business;

	@Override
	public List<MyReviewVO> myReviewList(int user_idx) {
		List<ReviewVO> list = dao.myReviewList(user_idx);
		
		List<MyReviewVO> real_list = new ArrayList<MyReviewVO>();
		MyReviewVO mrvo = null;
		
		for(ReviewVO tmp : list) {
			mrvo = new MyReviewVO(tmp.getIdx(),
					tmp.getBusiness_idx(),
					dao_business.businessInfo(tmp.getBusiness_idx()).getPlace_name(),
					tmp.getRating(), tmp.getDate(), tmp.getContent(), tmp.getImages(), tmp.getTotal_likes(), 
					dao_business.businessInfo(tmp.getBusiness_idx()).getRoad_address_name());
			real_list.add(mrvo);
			System.out.println(tmp.getIdx());
			
			
		}
		return real_list;
	}

	@Override
	public void deleteMyReview(int idx) {
		dao.deleteMyReview(idx);
	}

	// 도연추가
	public void multiFileUpload(ReviewVO vo, ServletContext application) {

		String filePath = application.getRealPath("resources/Upload/");
		MultipartFile[] arrMultipart = vo.getMultipart();
		String str = "";
		// String[] arrFilename = new String[arrMultipart.length];//getthe size of the
		// file that has been uploaded

		for (int i = 0; i < arrMultipart.length; i++) {
			String filename = "";
			MultipartFile multipart = arrMultipart[i];

			if (multipart.isEmpty() == false) { // if there's a file exists
				filename = multipart.getOriginalFilename();
				File file = new File(filePath, filename);
				if (file.exists() == false) {
					file.mkdirs();
				}
				try {
					multipart.transferTo(file);
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				str += filename + "&";
			}

		} // end of the for loop
		/* end of the file */
		vo.setImages(str); // set the file to vo into the names;

		dao.multiFileUpload(vo);

	}

	@Override
	public String[] randompicture(int idx) {
		String randomImage = dao.randompicture(idx);
		String[] str = new String[] {};

		if (randomImage != null) {
			str = randomImage.split("&");
			return str;
		}

		else {
			String[] str2 = new String[1];
			str2[0] = "huba.png"; // 기본이미지 ! !
			return str2;
		}

	}

	@Override
	public String[] selectallpictures(int idx) {
		// 전체이미지가져오기
		List<String> allImages = dao.selectallpictures(idx);
		String[] str = new String[] {};
		String[] images = new String[] {};
		String str2 = "";
		int count = 0;

		if ((allImages != null) && !allImages.isEmpty()) {
			for (String image : allImages) {
				str2 += image + "&";
			}
			str = str2.split("&");

		}

		else {
			str = new String[1];
		}

		return str;
	}

	// 새봄추가
	@Override
	public void insertReview(ReviewVO vo) {
		dao.insertReview(vo);
	}

	@Override
	public List<ReviewVO> selectAllReview(int business_idx) {
		List<ReviewVO> list = dao.selectAllReview(business_idx);

		return list;
	}

	@Override
	public int countAllReview(int business_idx) {
		int count = dao.countAllReview(business_idx);
		return count;
	}

	@Override
	public double reviewAvg(int business_idx) {
		double average = dao.ratingAvg(business_idx);
		return average;
	}

	@Override
	public void updateLikes(int business_idx, int idx, int total_likes) {
		dao.updateLikes(business_idx, idx, total_likes);

	}

	@Override
	public List<ReviewVO> selectNewReview() {
		List<ReviewVO> list = dao.selectNewReview();
		return list;
	}

	@Override
	public List<ReviewVO> orderByPopularReview(int business_idx) {
		List<ReviewVO> list = dao.orderByPopularReview(business_idx);
		return list;
	}

}
