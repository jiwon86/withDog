package a.b.c.com.common.service;

import a.b.c.com.qna.vo.QnaVO;
import a.b.c.com.qna.vo.RqnaVO;
import a.b.c.com.map.vo.MapTradeVO;

import a.b.c.com.member.vo.Member;
<<<<<<< HEAD
import a.b.c.com.park.vo.ParkVO;
=======
import a.b.c.com.notice.vo.NoticeVO;
>>>>>>> branch 'master' of https://github.com/jiwon86/withDog


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
<<<<<<< HEAD
	public ParkVO getParkChabun();
=======
	public QnaVO getQnaChabun();
	public RqnaVO getRqnaChabun();
	
	
	public NoticeVO getNoticeChabun();
>>>>>>> branch 'master' of https://github.com/jiwon86/withDog
	
}
