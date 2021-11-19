package a.b.c.com.review.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.b.c.com.member.controller.MemberController;
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
	public ArrayList selectReview(ReviewVO rvo) {
		// TODO Auto-generated method stub
		logger.info("ReviewDAOImpl selectReview() 함수진입 >>> ");
		return null;
	}

	@Override
	public List selectAllReview(ReviewVO rvo) {
		// TODO Auto-generated method stub
		logger.info("ReviewDAOImpl selectAllReview() 함수진입 >>> ");
		return sqlSession.selectList("selectAllReview", rvo);
	}

	@Override
	public int updateReview(ReviewVO rvo) {
		// TODO Auto-generated method stub
		logger.info("ReviewDAOImpl updateReview() 함수진입 >>> ");
		return 0;
	}

	@Override
	public int deleteReview(ReviewVO rvo) {
		// TODO Auto-generated method stub
		logger.info("ReviewDAOImpl deleteReview() 함수진입 >>> ");
		return 0;
	}

}
