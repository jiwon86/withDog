package a.b.c.com.review.service;

import java.util.List;

import a.b.c.com.member.vo.MemberVO;
import a.b.c.com.review.vo.ReviewVO;

public interface ReviewService {

	public int insertReview(ReviewVO rvo);
	public List<ReviewVO> selectReview(ReviewVO rvo);
	public List<ReviewVO> selectAllReview(ReviewVO rvo);
	public int updateReview(ReviewVO rvo);
	public int deleteReview(ReviewVO rvo);
	
	// 아이디 검색 페이징
	public List<ReviewVO> reviewSelectAllserch(ReviewVO rvo);
	
	// 해당 작성자만 수정 삭제
	public List<MemberVO> selectRwriter(ReviewVO rvo);
	
	// 마이페이지 해당 아이디만 전체조회
	public List<ReviewVO> reviewIDlist(ReviewVO rvo);
	
	
}
