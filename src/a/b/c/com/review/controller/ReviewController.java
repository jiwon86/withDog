package a.b.c.com.review.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import a.b.c.com.common.ChabunUtil;
import a.b.c.com.common.CommonUtils;
import a.b.c.com.common.FileUploadUtil;
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
		
		List<ReviewVO> listAll = reviewService.selectAllReview(rvo);
		logger.info("ReviewController() listAll.size() >>> : " + listAll.size());
		
		if (listAll.size() > 0) {
			
			model.addAttribute("listAll", listAll);
			return "review/reviewSelectAll";
		}
		
		return "review/reviewInsertForm";
	}
	
	// 게시판 글 입력 폼
	@RequestMapping(value="reviewInsertForm", method=RequestMethod.GET)
	public String reviewInsertForm() {		
		
		logger.info("reviewInsertForm() 함수 진입 ");
		
		
		return "review/reviewInsertForm";
	}
	
	// 후기입력하기
	@RequestMapping(value="reviewInsert", method=RequestMethod.POST)
	public String reviewInsert (HttpServletRequest req) {
		 
		logger.info("reviewInsert() 함수 진입 >>> : ");
		
		// 후기번호 채번구하기
		// String crnum = ChabunUtil.getBoardChabun("R", chabunService.getReviewChabun().get.Crnum)

		// 돌봄신청번호 채번구하기
		// String cnum = ChabunUtil.getBoardChabun("W", chabunService.getReviewChabun().get.Cnum)
		
		// 돌봄신청번호 채번구하기
		// String nnum = ChabunUtil.getBoardChabun("C", chabunService.getReviewChabun().get.Nnum)
		
		// 이미지 업로드
		/*
		 * FileUploadUtil fu = new FileUploadUtil(CommonUtils.REVIEW_IMG_UPLOAD_PATH,
		 * 										  CommonUtils.REVIEW_IMG_FILE_SIZE, 
		 * 										  CommonUtils.REVIEW_EN_CODE);
		 */
		
		// 이미지 파일 원본 사이즈
		// 이미지 파일 원본 사이즈 크기 조절하기
		/*
		 * boolean bool = fu.imgfileUploadSize(req);
		 * logger.info("ReviewController reviewInsert bool >>> " + _bool);
		 */
		
		// 채번, 이미리 업로드 성공하면 VO세팅하기
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
