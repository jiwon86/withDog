package a.b.c.com.review.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import a.b.c.com.member.vo.MemberVO;
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
	public List<ReviewVO> selectReview(ReviewVO rvo) {
		// TODO Auto-generated method stub
		logger.info("ReviewServiceImpl selectReview() 함수진입 >>> ");
		return reviewDAO.selectReview(rvo);
	}

	@Override
	public List<ReviewVO> selectAllReview(ReviewVO rvo) {
		// TODO Auto-generated method stub
		logger.info("ReviewServiceImpl selectAllReview() 함수진입 >>> ");
		return reviewDAO.selectAllReview(rvo);
	}

	@Override
	public int updateReview(ReviewVO rvo) {
		// TODO Auto-generated method stub
		logger.info("ReviewServiceImpl updateReview() 함수진입 >>> ");
		return reviewDAO.updateReview(rvo);
	}

	@Override
	public int deleteReview(ReviewVO rvo) {
		// TODO Auto-generated method stub
		logger.info("ReviewServiceImpl deleteReview() 함수진입 >>> ");
		return reviewDAO.deleteReview(rvo);
	}
	
	// 아이디 검색 페이징
	@Override
	public List<ReviewVO> reviewSelectAllserch(ReviewVO rvo) {
		// TODO Auto-generated method stub
		logger.info("ReviewServiceImpl reviewSelectAllserch() 함수진입 >>> ");
		return reviewDAO.reviewSelectAllserch(rvo);
	}
	
	// 후기게시판 해당 아이디만 나오게 전체조회
	@Override
	public List<ReviewVO> reviewIDlist(ReviewVO rvo) {
		// TODO Auto-generated method stub
		logger.info("ReviewServiceImpl reviewIDlist() 함수진입 >>> ");
		return reviewDAO.reviewIDlist(rvo);
	}

	@Override
	public List<MemberVO> selectRwriter(ReviewVO rvo) {
		// TODO Auto-generated method stub
		logger.info("ReviewServiceImpl selectRwriter() 함수진입 >>> ");
		return reviewDAO.selectRwriter(rvo);
	}
	
}
