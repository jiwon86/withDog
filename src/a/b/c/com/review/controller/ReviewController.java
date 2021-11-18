package a.b.c.com.review.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import a.b.c.com.common.service.ChabunService;
import a.b.c.com.member.controller.MemberController;
import a.b.c.com.review.service.ReviewService;
import a.b.c.com.review.vo.ReviewVO;

@Controller
public class ReviewController {
	
	private Logger logger = Logger.getLogger(MemberController.class);

	// 서비스 연결
	private ReviewService reviewService;
	private ChabunService chabunService;
	
	// 생성자 오토와이어드
	@Autowired(required=false)
	public ReviewController( ReviewService reviewService, ChabunService chabunService) {
		
		this.reviewService =  reviewService;
		this.chabunService = chabunService;
	}
	
	//전제 조회
	@RequestMapping(value="reviewSelectAll", method=RequestMethod.GET)
	public String reviewSelectAll(ReviewVO rvo, Model model) {
		
		logger.info("reviewSelectAll() 함수진입 >>> : ");
		
		return "review/reviewSelectAll";
	}
	
	// 게시판 글 입력 폼
	@RequestMapping(value="reviewInsertForm", method=RequestMethod.GET)
	public String reviewInsertForm() {		
		
		logger.info("reviewInsertForm() 함수 진입 ");
		
		return "review/reviewInsertForm";
	}
	
	// 글쓰기
	@RequestMapping(value="reviewInsert", method=RequestMethod.POST)
	public String reviewInsert (HttpServletRequest req) {
		 
		ReviewVO _rvo = null;
		_rvo = new ReviewVO();
		
		
		
		_rvo.setCrnum("crnum");
		_rvo.setCnum("cnum");
		_rvo.setNnum("nnum");
		_rvo.setCrscore("crscore");
		_rvo.setCrmemo("crmemo");
		_rvo.setCphoto("cphoto");
		_rvo.setCrreport("crreport");
		
		logger.info("reviewInsert() 함수 진입 _rvo.getCrnum" + _rvo.getCrnum());
		logger.info("reviewInsert() 함수 진입 _rvo.getCnum" + _rvo.getCnum());
		logger.info("reviewInsert() 함수 진입 _rvo.getNnum" + _rvo.getNnum());
		logger.info("reviewInsert() 함수 진입 _rvo.getCrscore" + _rvo.getCrscore());
		logger.info("reviewInsert() 함수 진입 _rvo.getCrmemo" + _rvo.getCrmemo());
		logger.info("reviewInsert() 함수 진입 _rvo.getCphoto" + _rvo.getCphoto());
		logger.info("reviewInsert() 함수 진입 _rvo.getCrreport" + _rvo.getCrreport());
		
		return "review/reviewSelectAll";
	}

}
