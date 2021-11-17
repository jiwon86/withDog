package a.b.c.com.map.service;

import java.util.List;

import a.b.c.com.map.vo.MapTradeVO;

public interface MapService {

	public List<MapTradeVO> setMarkers (MapTradeVO mvo);
	public int mapTradeInsert(MapTradeVO mvo);
}
