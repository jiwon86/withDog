package a.b.c.com.review.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import a.b.c.com.common.ChabunUtil;
import a.b.c.com.common.CommonUtils;
import a.b.c.com.common.FileUploadUtil;
import a.b.c.com.common.service.ChabunService;
import a.b.c.com.member.controller.MemberController;
import a.b.c.com.review.service.ReviewService;
import a.b.c.com.review.vo.ReviewVO;

@Controller
public class ReviewController {
	
	private Logger logger = Logger.getLogger(ReviewController.class);

	// 서비스 연결
	private ReviewService reviewService;
	private ChabunService chabunService;
	
	// 생성자 오토와이어드
	@Autowired(required=false)
	public ReviewController( ReviewService reviewService, ChabunService chabunService) {
		
		this.reviewService =  reviewService;
		this.chabunService = chabunService;
	}
	
	// 게시판 글 입력 폼
	@RequestMapping(value="reviewInsertForm", method=RequestMethod.GET)
	public String reviewInsertForm() {		
		
		logger.info("reviewInsertForm() 함수 진입 ");
		
		
		return "review/reviewInsertForm";
	}
	
	// 후기입력하기 버튼을 눌렀을 때
	@RequestMapping(value="reviewInsert", method=RequestMethod.POST)
	public String reviewInsert(ReviewVO rvo, Model model) {
		
		logger.info("ReviewInsert() 함수 진입 >>> : ");
		logger.info("crsubject : " + rvo.getCrsubject());
		logger.info("crwriter : "  + rvo.getCrwriter());
		logger.info("crscore : " + rvo.getCrscore());
		logger.info("crmemo : " + rvo.getCrmemo());
		logger.info("crreport : " + rvo.getCrreport());
		
		String crnum = ChabunUtil.getReviewCrnumChabun("R", chabunService.getReviewCrnumChabun().getCrnum());
		logger.info("ReviewController reviewInsert crnum >>> : " + crnum);
		
		/*
		 * String cnum = ChabunUtil.getReviewCnumChabun("C",
		 * chabunService.getReviewCnumChabun().getCnum());
		 * logger.info("ReviewController reviewInsert cnum >>> : " + cnum);
		 */
		
		rvo.setCrnum(crnum);
		rvo.setCnum("1");
		rvo.setCrsubject(rvo.getCrsubject());
		rvo.setCrwriter(rvo.getCrwriter());
		rvo.setCrmemo(rvo.getCrmemo());
		rvo.setCrreport(rvo.getCrreport());
		
		logger.info("crsubject : " + rvo.getCrsubject());
		logger.info("crwriter : "  + rvo.getCrwriter());
		logger.info("crscore : " + rvo.getCrscore());
		logger.info("crmemo : " + rvo.getCrmemo());
		logger.info("crreport : " + rvo.getCrreport());
		
		int nCnt = reviewService.insertReview(rvo);
		
		if (nCnt > 0) {return "review/reviewInsert";}
		
		return "review/reviewInsertForm";
		
	}
	
	//전제 조회
	@RequestMapping(value="reviewSelectAll", method=RequestMethod.GET)
	public String reviewSelectAll(ReviewVO rvo, Model model) {
		
		logger.info("ReviewController reviewSelectAll() 함수진입 >>> : ");
		logger.info("ReviewController reviewSelectAll rvo.getCrnum() : " + rvo.getCrnum());
		logger.info("ReviewController reviewSelectAll rvo.getCnum() : " + rvo.getCnum());
		logger.info("ReviewController reviewSelectAll rvo.getCrsubject() : " + rvo.getCrsubject());
		logger.info("ReviewController reviewSelectAll rvo.getCrwriter() : " + rvo.getCrwriter());
		logger.info("ReviewController reviewSelectAll rvo.getCrscore() : " + rvo.getCrscore());
		logger.info("ReviewController reviewSelectAll rvo.getCrmemo() : " + rvo.getCrmemo());
		logger.info("ReviewController reviewSelectAll rvo.getCrreport() : " + rvo.getCrreport());
		
		List<ReviewVO> listAll = reviewService.selectAllReview(rvo);
		logger.info("ReviewController selectAllReview listAll.size() >>> : " + listAll.size());
		
		if(listAll.size() > 0) {
			
			model.addAttribute("listAll", listAll);
			return "review/reviewSelectAll";
			
		}
		
		
		return "review/reviewInsertForm";
	}
	
	// 조건조회
	@RequestMapping(value="reviewSelect", method=RequestMethod.GET)
	public String reviewSelect(ReviewVO rvo, Model model) {
		
		logger.info("ReviewController reviewSelect() 함수진입 >>> : ");
		logger.info("ReviewController reviewSelect rvo.getCnum() >>> : " + rvo.getCnum());
		
		List<ReviewVO> listS = reviewService.selectReview(rvo);
		logger.info("ReviewController reviewSelect listS.size() >>> : " + listS.size());
		
		if (listS.size() == 1) {
			model.addAttribute("listS", listS);
			return "review/reviewSelect";
		}
		
		return "review/reviewSelectAll";
		
	}
	
	// 수정하기 폼으로가기
	@RequestMapping(value="reviewUpdateForm", method=RequestMethod.GET)
	public String reviewUpdate(ReviewVO rvo, Model model) {
		
		logger.info("ReviewController reviewUpdate() 함수진입 >>> : ");
		
		logger.info("ReviewController reviewUpdate rvo.getCrnum() >>> : " + rvo.getCrnum());
		logger.info("ReviewController reviewUpdate rvo.getCrscore() >>> : " + rvo.getCrscore());
		logger.info("ReviewController reviewUpdate rvo.getCrmemo() >>> : " + rvo.getCrmemo());
		
		String crnum = rvo.getCrnum();
		System.out.println("crnum >>> : " + crnum);
		rvo.setCrnum(rvo.getCrnum());
		
		List<ReviewVO> listS = reviewService.selectReview(rvo);
		
		if (listS.size() == 1) {
			model.addAttribute("listS", listS);
			return "review/reviewUpdateForm";
		}
		
		return "review/reviewSelect";
	}
}
