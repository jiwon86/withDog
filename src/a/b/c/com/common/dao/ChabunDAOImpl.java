package a.b.c.com.common.dao;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.b.c.com.agency.vo.AgencyVO;
import a.b.c.com.agency.vo.ConditionVO;
import a.b.c.com.agency.vo.PayVO;
import a.b.c.com.pet.vo.PetVO;
import a.b.c.com.qna.vo.QnaVO;
import a.b.c.com.qna.vo.RqnaVO;
import a.b.c.com.map.vo.MapTradeVO;
import a.b.c.com.review.vo.ReviewVO;
import a.b.c.com.member.vo.MemberVO;
import a.b.c.com.park.vo.ParkVO;
import a.b.c.com.park.vo.RparkVO;


import a.b.c.com.notice.vo.NoticeVO;


@Repository
public class ChabunDAOImpl implements ChabunDAO {
	private Logger logger = Logger.getLogger(ChabunDAOImpl.class);

	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	@Override
	public PetVO getPetChabun() {
		// TODO Auto-generated method stub
		
		return sqlSession.selectOne("getPetChabun");
	}
	
	@Override
	public MemberVO getMemChabun() {
		logger.info("ChabunDAOImpl.getMemChabun() 함수 진입");
		return sqlSession.selectOne("getMemChabun");
	}


	@Override
	public AgencyVO getAgencyChabun() {
		logger.info("ChabunDAOImpl.getAgencyChabun() 함수 진입");
		
		return sqlSession.selectOne("getAgencyChabun");
	}
	
	@Override
	public MapTradeVO getMapChabun() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getMapChabun");
	}

	@Override
	public ParkVO getParkChabun() {
		// TODO Auto-generated method stub
		logger.info("ChabunDAOImpl.getParkChabun() 함수 진입");
		
		return sqlSession.selectOne("getParkChabun");
	}

	@Override
	public RparkVO getRparkChabun() {
		// TODO Auto-generated method stub
		logger.info("ChabunDAOImpl.getRparkChabun() 함수 진입");
		return sqlSession.selectOne("getRparkChabun");
	}

	

	// review
	@Override
	public ReviewVO getReviewCrnumChabun() {
		logger.info("ChabunDAOImpl.getReviewCrnumChabun() 함수 진입");
		
		return sqlSession.selectOne("getReviewCrnumChabun");
	}
	
	@Override
	public ReviewVO getReviewCnumChabun() {
		logger.info("ChabunDAOImpl.getReviewCnumChabun() 함수 진입");
		
		return sqlSession.selectOne("getReviewCnumChabun");
	}
	

	@Override
	public NoticeVO getNoticeChabun() {
		logger.info("ChabunDAOImpl.getNoticeChabun() 함수 진입 : ");

		// TODO Auto-generated method stub
		return sqlSession.selectOne("getNoticeChabun");
	}
	
	@Override
	public QnaVO getQnaChabun() {
		logger.info("ChabunDAOImpl.getQnaChabun() 함수 진입");
		return sqlSession.selectOne("getQnaChabun");
	}
	
	@Override
	public RqnaVO getRqnaChabun() {
		logger.info("ChabunDAOImpl.getRqnaChabun() 함수 진입");
		return sqlSession.selectOne("getRqnaChabun");
	}

	@Override
	public PayVO getPayChabun() {
		logger.info("ChabunDAOImpl.getPayChabun() 함수 진입");
		
		return sqlSession.selectOne("getPayChabun");
	}

	@Override
	public ConditionVO getConditionChabun() {
		logger.info("ChabunDAOImpl.getConditionChabun() 함수 진입");
		
		return sqlSession.selectOne("getConditionChabun");
	}
	
}
