package a.b.c.com.common.service;

import a.b.c.com.qna.vo.QnaVO;

import a.b.c.com.map.vo.MapTradeVO;

import a.b.c.com.member.vo.Member;


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
	public QnaVO getQnaChabun();
	
}
