package a.b.c.com.common.dao;


import a.b.c.com.pet.vo.PetVO;
import a.b.c.com.qna.vo.QnaVO;
import a.b.c.com.qna.vo.RqnaVO;

import a.b.c.com.map.vo.MapTradeVO;
import a.b.c.com.member.vo.Member;
import a.b.c.com.review.vo.ReviewVO;


import a.b.c.com.park.vo.ParkVO;

import a.b.c.com.park.vo.RparkVO;
import a.b.c.com.notice.vo.NoticeVO;


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
	
	
	// review
	public ReviewVO getReviewCrnumChabun();
	public ReviewVO getReviewCnumChabun();
	

	public ParkVO getParkChabun();

	public RparkVO getRparkChabun();
	
//	public NoticeVO getNoitceChabun();
//	public NoticeVO getRnoticeChabun();


	//	public NoticeVO getNoitceChabun();
	//	public NoticeVO getRnoticeChabun();
	public NoticeVO getNoticeChabun();	

	public QnaVO getQnaChabun();
	public RqnaVO getRqnaChabun();


}
