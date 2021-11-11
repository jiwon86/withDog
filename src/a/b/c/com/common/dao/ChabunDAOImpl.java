package a.b.c.com.common.dao;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChabunDAOImpl implements ChabunDAO {
	private Logger logger = Logger.getLogger(ChabunDAOImpl.class);

	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	/*
	@Override
	public SpringBoardVO getBoardChabun() {
		logger.info("ChabunDAOImpl.getBoardChabun() 함수 진입");
		
		return sqlSession.selectOne("getBoardChabun");
	}

	@Override
	public SpringRboardVO getRboardChabun() {
		logger.info("ChabunDAOImpl.getRboardChabun() 함수 진입");
		
		return sqlSession.selectOne("getRboardChabun");
	}

	@Override
	public SpringMemberVO getMemChabun() {
		logger.info("ChabunDAOImpl.getMemChabun() 함수 진입");
		
		return sqlSession.selectOne("getMemChabun");
	}
	*/
	
}
