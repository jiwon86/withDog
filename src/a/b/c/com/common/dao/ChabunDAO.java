package a.b.c.com.common.dao;


import a.b.c.com.pet.vo.PetVO;


import a.b.c.com.map.vo.MapTradeVO;
import a.b.c.com.member.vo.Member;


public interface ChabunDAO {
	
	public PetVO getPetChabun();
	/*
	public SpringBoardVO getBoardChabun();
	public SpringRboardVO getRboardChabun();
	public SpringMemberVO getMemChabun();
	*/
	public MapTradeVO getMapChabun();

//	public Member getBoardChabun();
//	public Member getRboardChabun();
	public Member getMemChabun();

}
