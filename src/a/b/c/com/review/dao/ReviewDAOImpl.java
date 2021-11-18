package a.b.c.com.review.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.b.c.com.review.vo.ReviewVO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertReview(ReviewVO rvo) {
		// TODO Auto-generated method stub
		return (Integer)sqlSession.insert("insertReview", rvo);
	}

	@Override
	public ArrayList selectReview(ReviewVO rvo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List selectAllReview(ReviewVO rvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("selectAllReview", rvo);
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
