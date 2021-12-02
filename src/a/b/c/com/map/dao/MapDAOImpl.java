package a.b.c.com.map.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import a.b.c.com.map.vo.MapTradeVO;

@Repository
public class MapDAOImpl implements MapDAO {

	// LOG SET
	Logger logger = Logger.getLogger(MapDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public List<MapTradeVO> setMarkers(MapTradeVO mvo) {
		// TODO Auto-generated method stub
		logger.info("MapDAOImpl-----setMarkers()");
		return sqlSession.selectList("setMarkers", mvo);
	}


	@Override
	public int mapTradeInsert(MapTradeVO mvo) {
		// TODO Auto-generated method stub
		logger.info("MapDAOImpl-----mapTradeInsert()");
		return (Integer)sqlSession.insert("mapTradeInsert", mvo);
	}

	@Override
	public int mapTradeUpdate(MapTradeVO mvo) {
		// TODO Auto-generated method stub
		logger.info("MapDAOImpl-----mapTradeUpdate()");
		return (Integer)sqlSession.update("mapTradeUpdate", mvo);
	}


	@Override
	public MapTradeVO selectMarker(String tno) {
		// TODO Auto-generated method stub
		logger.info("MapDAOImpl.selectMarker()");
		return sqlSession.selectOne("selectMarker", tno);
	}


	@Override
	public List<MapTradeVO> selectTrade(MapTradeVO mvo) {
		// TODO Auto-generated method stub
		logger.info("MapDAOImpl.selectTrade()");
		return sqlSession.selectList("selectTrade", mvo);
	}

	
	
}
