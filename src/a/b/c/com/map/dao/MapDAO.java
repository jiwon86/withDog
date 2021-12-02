package a.b.c.com.map.dao;

import java.util.List;

import a.b.c.com.map.vo.MapTradeVO;

public interface MapDAO {

	public List<MapTradeVO> setMarkers (MapTradeVO mvo);
	public List<MapTradeVO> selectTrade (MapTradeVO mvo);
	public int mapTradeInsert(MapTradeVO mvo);
	public int mapTradeUpdate(MapTradeVO mvo);
	public MapTradeVO selectMarker(String tno);
}
