package a.b.c.com.review.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.b.c.com.member.controller.MemberController;
import a.b.c.com.member.vo.Member;
import a.b.c.com.review.vo.ReviewVO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	// logger 선언
	private Logger logger = Logger.getLogger(ReviewDAOImpl.class);
	
	// 생성자 오토와이어드
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertReview(ReviewVO rvo) {
		// TODO Auto-generated method stub
		logger.info("ReviewDAOImpl insertReview() 함수진입 >>> ");
		return (Integer)sqlSession.insert("insertReview", rvo);
	}

	@Override
	public List<ReviewVO> selectReview(ReviewVO rvo) {
		// TODO Auto-generated method stub
		logger.info("ReviewDAOImpl selectReview() 함수진입 >>> ");
		return sqlSession.selectList("selectReview", rvo);
	}

	@Override
	public List<ReviewVO> selectAllReview(ReviewVO rvo) {
		// TODO Auto-generated method stub
		logger.info("ReviewDAOImpl selectAllReview() 함수진입 >>> ");
		return sqlSession.selectList("selectAllReview", rvo);
	}

	@Override
	public int updateReview(ReviewVO rvo) {
		// TODO Auto-generated method stub
		logger.info("ReviewDAOImpl updateReview() 함수진입 >>> ");
		return (Integer)sqlSession.update("updateReview", rvo);
	}

	@Override
	public int deleteReview(ReviewVO rvo) {
		// TODO Auto-generated method stub
		logger.info("ReviewDAOImpl deleteReview() 함수진입 >>> ");
		return (Integer)sqlSession.delete("deleteReview", rvo);
	}
	
	// 아이디 검색 페이징
	@Override
	public List<ReviewVO> reviewSelectAllserch(ReviewVO rvo) {
		// TODO Auto-generated method stub
		logger.info("ReviewServiceImpl reviewSelectAllserch() 함수진입 >>> ");
		return sqlSession.selectList("reviewSelectAllserch", rvo);
	}

	// 후기게시판 해당 아이디만 나오게 전체조회
	@Override
	public List<ReviewVO> reviewIDlist(ReviewVO rvo) {
		// TODO Auto-generated method stub
		logger.info("ReviewServiceImpl ReviewPaging() 함수진입 >>> ");
		return sqlSession.selectList("reviewIDlist", rvo);
	}

	@Override
	public List<Member> selectRwriter(ReviewVO rvo) {
		// TODO Auto-generated method stub
		logger.info("ReviewServiceImpl selectRwriter() 함수진입 >>> ");
		return null;
	}

}
