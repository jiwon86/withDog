package a.b.c.com.common.service;


import a.b.c.com.map.vo.MapTradeVO;

import a.b.c.com.member.vo.Member;
import a.b.c.com.notice.vo.NoticeVO;


public interface ChabunService {

	/*
	public SpringBoardVO getBoardChabun();
	public SpringRboardVO getRboardChabun();
	public SpringMemberVO getMemChabun();
	*/
	public MapTradeVO getMapChabun();

	
//	public Member getBoardChabun();
//	public Member getRboardChabun();
	public Member getMemChabun();
	
	
	public NoticeVO getNoticeChabun();
	
}
