package a.b.c.com.park.dao;

import java.util.List;

import a.b.c.com.park.vo.RparkVO;

public interface RparkDAO {
	
	public List<RparkVO> rparkSelect(RparkVO rsvo);
	public List<RparkVO> rparkSelectAll(RparkVO rsvo);
	public int rparkInsert(RparkVO rsvo);
	public int rparkDelete(RparkVO rsvo);

}
