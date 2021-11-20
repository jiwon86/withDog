package a.b.c.com.map.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import a.b.c.com.map.dao.MapDAO;
import a.b.c.com.map.vo.MapTradeVO;

@Service
@Transactional
public class MapServiceImpl implements MapService{
	
	// LOG SET
	Logger logger = Logger.getLogger(MapServiceImpl.class);
	
	private MapDAO mapDAO;
	
	@Autowired(required=false)
	public MapServiceImpl (MapDAO mapDAO) {
		this.mapDAO = mapDAO;
	}
	
	@Override
	public List<MapTradeVO> setMarkers(MapTradeVO mvo) {
		// TODO Auto-generated method stub
		logger.info("MapServiceImpl setMarkers()");
		return mapDAO.setMarkers(mvo);
	}

	@Override
	public int mapTradeInsert(MapTradeVO mvo) {
		// TODO Auto-generated method stub
		logger.info("MapServiceImpl mapTradeInsert()");
		return mapDAO.mapTradeInsert(mvo);
	}
	
	@Override
	public int mapTradeUpdate(MapTradeVO mvo) {
		// TODO Auto-generated method stub
		logger.info("MapServiceImpl.mapTradeUpdate()");
		return mapDAO.mapTradeUpdate(mvo);
	}

	@Override
	public MapTradeVO selectMarker(String tno) {
		// TODO Auto-generated method stub
		logger.info("MapServiceImpl selectMarker()");
		return mapDAO.selectMarker(tno);
	}

	@Override
	public List<MapTradeVO> selectTrade(MapTradeVO mvo) {
		// TODO Auto-generated method stub
		logger.info("MapServiceImpl.selectTrade");
		return mapDAO.selectTrade(mvo);
	}
	
	

}
