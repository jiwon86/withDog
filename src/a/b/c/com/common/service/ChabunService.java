package a.b.c.com.common.service;

import a.b.c.com.agency.vo.AgencyVO;
import a.b.c.com.agency.vo.ConditionVO;
import a.b.c.com.agency.vo.PayVO;
import a.b.c.com.map.vo.MapTradeVO;
import a.b.c.com.member.vo.MemberVO;
import a.b.c.com.notice.vo.NoticeVO;
import a.b.c.com.park.vo.ParkVO;

import a.b.c.com.pet.vo.PetVO;
import a.b.c.com.qna.vo.QnaVO;
import a.b.c.com.qna.vo.RqnaVO;

import a.b.c.com.map.vo.MapTradeVO;

import a.b.c.com.review.vo.ReviewVO;

import a.b.c.com.park.vo.ParkVO;
import a.b.c.com.park.vo.RparkVO;
import a.b.c.com.notice.vo.NoticeVO;

public interface ChabunService {

	public PetVO getPetChabun();

	public MapTradeVO getMapChabun();

	public MemberVO getMemChabun();
	public AgencyVO getAgencyChabun();
	public ParkVO getParkChabun();
	public RparkVO getRparkChabun();
	
	public QnaVO getQnaChabun();
	public RqnaVO getRqnaChabun();

	
	// review
	public ReviewVO getReviewCrnumChabun();
	public ReviewVO getReviewCnumChabun();
	

	public NoticeVO getNoticeChabun();
	public PayVO getPayChabun();
	public ConditionVO getConditionChabun();
}
