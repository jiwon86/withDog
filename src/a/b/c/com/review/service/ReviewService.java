package a.b.c.com.review.service;

import java.util.List;

import a.b.c.com.review.vo.ReviewVO;

public interface ReviewService {

	public int insertReview(ReviewVO rvo);
	public List selectReview(ReviewVO rvo);
	public List selectAllReview(ReviewVO rvo);
	public int updateReview(ReviewVO rvo);
	public int deleteReview(ReviewVO rvo);
}
