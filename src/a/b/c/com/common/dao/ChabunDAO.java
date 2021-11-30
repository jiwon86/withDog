package a.b.c.com.common.dao;


import a.b.c.com.map.vo.MapTradeVO;
import a.b.c.com.member.vo.Member;
import a.b.c.com.park.vo.ParkVO;


public interface ChabunDAO {

	/*
	public SpringBoardVO getBoardChabun();
	public SpringRboardVO getRboardChabun();
	public SpringMemberVO getMemChabun();
	*/
	public MapTradeVO getMapChabun();

//	public Member getBoardChabun();
//	public Member getRboardChabun();
	public Member getMemChabun();
	public ParkVO getParkChabun();

}
