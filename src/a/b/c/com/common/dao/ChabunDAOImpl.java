package a.b.c.com.common.dao;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.b.c.com.agency.vo.AgencyVO;
import a.b.c.com.map.vo.MapTradeVO;
import a.b.c.com.member.vo.MemberVO;


@Repository
public class ChabunDAOImpl implements ChabunDAO {
	private Logger logger = Logger.getLogger(ChabunDAOImpl.class);

	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;

	@Override
	public MapTradeVO getMapChabun() {
		// TODO Auto-generated method stub
		logger.info("ChabunDAOImpl.getMapChabun()");
		return sqlSession.selectOne("getMapChabun");
	}
	
	
//	@Override
//	public Member getBoardChabun() {
//		logger.info("ChabunDAOImpl.getBoardChabun() 함수 진입");
//		
//		return sqlSession.selectOne("getBoardChabun");
//	}
	/*
	@Override
	public SpringRboardVO getRboardChabun() {
		logger.info("ChabunDAOImpl.getRboardChabun() 함수 진입");
		
		return sqlSession.selectOne("getRboardChabun");
	}
*/
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
	
}
