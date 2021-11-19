package a.b.c.com.review.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import a.b.c.com.review.dao.ReviewDAO;
import a.b.c.com.review.dao.ReviewDAOImpl;
import a.b.c.com.review.vo.ReviewVO;

@Service
@Transactional
public class ReviewServiceImpl implements ReviewService {

	// logger 선언
	private Logger logger = Logger.getLogger(ReviewDAOImpl.class);
	
	// DAO 불러오기
	private ReviewDAO reviewDAO;
	
	// 생성자 오토와이어드
	@Autowired(required=false)
	public ReviewServiceImpl(ReviewDAO reviewDAO) {
		
		this.reviewDAO = reviewDAO;
	}
	
	@Override
	public int insertReview(ReviewVO rvo) {
		// TODO Auto-generated method stub
		logger.info("ReviewServiceImpl insertReview() 함수진입 >>> ");
		return reviewDAO.insertReview(rvo);
	}

	@Override
	public List selectReview(ReviewVO rvo) {
		// TODO Auto-generated method stub
		logger.info("ReviewServiceImpl selectReview() 함수진입 >>> ");
		return null;
	}

	@Override
	public List selectAllReview(ReviewVO rvo) {
		// TODO Auto-generated method stub
		logger.info("ReviewServiceImpl selectAllReview() 함수진입 >>> ");
		return reviewDAO.selectAllReview(rvo);
	}

	@Override
	public int updateReview(ReviewVO rvo) {
		// TODO Auto-generated method stub
		logger.info("ReviewServiceImpl updateReview() 함수진입 >>> ");
		return 0;
	}

	@Override
	public int deleteReview(ReviewVO rvo) {
		// TODO Auto-generated method stub
		logger.info("ReviewServiceImpl deleteReview() 함수진입 >>> ");
		return 0;
	}

}
