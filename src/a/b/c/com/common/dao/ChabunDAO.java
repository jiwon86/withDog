package a.b.c.com.common.dao;


import a.b.c.com.agency.vo.AgencyVO;
import a.b.c.com.map.vo.MapTradeVO;
import a.b.c.com.member.vo.MemberVO;


public interface ChabunDAO {

	/*
	public SpringBoardVO getBoardChabun();
	public SpringRboardVO getRboardChabun();
	public SpringMemberVO getMemChabun();
	*/
	public MapTradeVO getMapChabun();

//	public Member getBoardChabun();
//	public Member getRboardChabun();
	public MemberVO getMemChabun();

	public AgencyVO getAgencyChabun();
}
