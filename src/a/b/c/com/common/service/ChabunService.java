package a.b.c.com.common.service;


import a.b.c.com.map.vo.MapTradeVO;

import a.b.c.com.member.vo.Member;
import a.b.c.com.review.vo.ReviewVO;


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
	
	// review
	public ReviewVO getReviewCrnumChabun();
	public ReviewVO getReviewCnumChabun();
	
}
