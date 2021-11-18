package a.b.c.com.review.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import a.b.c.com.review.dao.ReviewDAO;
import a.b.c.com.review.vo.ReviewVO;

@Service
@Transactional
public class ReviewServiceImpl implements ReviewService {

	private ReviewDAO reviewDAO;
	
	@Autowired(required=false)
	public ReviewServiceImpl(ReviewDAO reviewDAO) {
		
		this.reviewDAO = reviewDAO;
	}
	
	@Override
	public int insertReview(ReviewVO rvo) {
		// TODO Auto-generated method stub
		
		return reviewDAO.insertReview(rvo);
	}

	@Override
	public List selectReview(ReviewVO rvo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List selectAllReview(ReviewVO rvo) {
		// TODO Auto-generated method stub
		return reviewDAO.selectAllReview(rvo);
	}

	@Override
	public int updateReview(ReviewVO rvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReview(ReviewVO rvo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
