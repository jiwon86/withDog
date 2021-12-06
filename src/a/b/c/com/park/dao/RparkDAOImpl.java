package a.b.c.com.park.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.b.c.com.park.vo.RparkVO;

@Repository
public class RparkDAOImpl implements RparkDAO {
	Logger logger = Logger.getLogger(RparkDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSession sqlSession;
	
	
	@Override
	public List<RparkVO> rparkSelect(RparkVO rsvo) {
		// TODO Auto-generated method stub
		logger.info("RparkDAOImpl rparkSelect >>> : ");
		return sqlSession.selectList("rparkSelect",rsvo);
	}

	@Override
	public List<RparkVO> rparkSelectAll(RparkVO rsvo) {
		// TODO Auto-generated method stub
		logger.info("RparkDAOImpl rparkSelevtAll >>> : ");
		return sqlSession.selectList("rparkSelectAll",rsvo);
	}
	
	@Override
	public int rparkInsert(RparkVO rsvo) {
		// TODO Auto-generated method stub
		logger.info("RparkDAOImpl rparkInsert >>> : ");
		return (Integer)sqlSession.insert("rparkInsert",rsvo);
	}

	@Override
	public int rparkDelete(RparkVO rsvo) {
		// TODO Auto-generated method stub
		logger.info("RparkDAOImpl rparkDelete >>> : ");
		return (Integer)sqlSession.update("rparkDelete",rsvo);
	}

	

}
