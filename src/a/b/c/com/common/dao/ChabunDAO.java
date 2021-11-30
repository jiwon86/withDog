package a.b.c.com.common.dao;


import a.b.c.com.qna.vo.QnaVO;
import a.b.c.com.qna.vo.RqnaVO;
import a.b.c.com.map.vo.MapTradeVO;
import a.b.c.com.member.vo.Member;
<<<<<<< HEAD
import a.b.c.com.park.vo.ParkVO;
=======
import a.b.c.com.notice.vo.NoticeVO;
>>>>>>> branch 'master' of https://github.com/jiwon86/withDog


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
<<<<<<< HEAD
	public ParkVO getParkChabun();
=======
	
//	public NoticeVO getNoitceChabun();
//	public NoticeVO getRnoticeChabun();
	public NoticeVO getNoticeChabun();	
	
	public QnaVO getQnaChabun();
	public RqnaVO getRqnaChabun();
>>>>>>> branch 'master' of https://github.com/jiwon86/withDog

}
