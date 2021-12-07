package a.b.c.com.review.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import a.b.c.com.common.ChabunUtil;
import a.b.c.com.common.CommonUtils;
import a.b.c.com.common.service.ChabunService;
import a.b.c.com.member.service.MemberService;
import a.b.c.com.member.vo.Member;
import a.b.c.com.review.service.ReviewService;
import a.b.c.com.review.vo.ReviewVO;

@Controller
public class ReviewController {
	
	private Logger logger = Logger.getLogger(ReviewController.class);
	// 서비스 연결
	private ReviewService reviewService;
	private MemberService memberService;
	private ChabunService chabunService;
	
	// 생성자 오토와이어드
	@Autowired(required=false)
	public ReviewController(ReviewService reviewService, MemberService memberService, ChabunService chabunService) {
		
		this.reviewService = reviewService;
		this.memberService = memberService;
		this.chabunService = chabunService;
	}
	
	
	// 게시판 글 입력 폼
	@RequestMapping(value="reviewInsertForm", method=RequestMethod.GET)
	public String reviewInsertForm(ReviewVO rvo, Model model) {		

		logger.info("reviewInsertForm() 함수 진입 ");
		
		
		return "review/reviewInsertForm";
	}
	
	

	// 후기입력하기 버튼을 눌렀을 때
	@RequestMapping(value="reviewInsert", method=RequestMethod.POST)
	public String reviewInsert(ReviewVO rvo, Model model) {
		
		logger.info("ReviewInsert() 함수 진입 >>> : ");
		logger.info("crsubject : " + rvo.getCrsubject());
		logger.info("rwriter : " + rvo.getRwriter());
		logger.info("crscore : " + rvo.getCrscore());
		logger.info("crmemo : " + rvo.getCrmemo());
		logger.info("crreport : " + rvo.getCrreport());
		
		// 채번쿼리
		String crnum = ChabunUtil.getReviewCrnumChabun("D", chabunService.getReviewCrnumChabun().getCrnum());
		logger.info("ReviewController reviewInsert crnum >>> : " + crnum);
		
		rvo.setCrnum(crnum);
		rvo.setMid(rvo.getMid());
		rvo.setRwriter(rvo.getRwriter());
		rvo.setCrsubject(rvo.getCrsubject());
		rvo.setCrscore(rvo.getCrscore());
		rvo.setCrmemo(rvo.getCrmemo());
		rvo.setCrreport(rvo.getCrreport());
		
		logger.info("crnum" + crnum);
		logger.info("mid : " + rvo.getMid());
		logger.info("rwriter : " + rvo.getRwriter());
		logger.info("crsubject : " + rvo.getCrsubject());
		logger.info("crscore : " + rvo.getCrscore());
		logger.info("crmemo : " + rvo.getCrmemo());
		logger.info("crreport : " + rvo.getCrreport());
		
		int nCnt = reviewService.insertReview(rvo);
		
		if (nCnt > 0) {return "review/reviewInsert";}
		
		return "review/reviewInsertForm";
		
	}
	
	// 마이 리뷰 프로필
	@RequestMapping(value="myReviewList", method=RequestMethod.GET)
	public String myReviewList(Model model, ReviewVO rvo, Principal principal) {
		
		logger.info("ReviewController.myReviewList() 함수 진입");
		
		String rmid = null;
		String mid = principal.getName();
		
		rmid = rvo.getMid();
		Member member = memberService.memberSelect(mid);

		List<ReviewVO> listAll = reviewService.selectAllReview(rvo);
		logger.info("listAll.size() >>> " + listAll.size());
		
		if(listAll.size() > 0) {
			
			model.addAttribute("member", member);
			model.addAttribute("listAll", listAll);
			
			List<ReviewVO> listId = reviewService.reviewIDlist(rvo);
			logger.info("listId.size() >>> " + listId.size());
			
			if(rmid != rvo.getMid()) {
				
			}else {
				
				model.addAttribute("listId", listId);
				return "review/reviewSelectAll";
			}
						
		}
		
		return "review/myReviewList";
	}
	
	//전제 조회
	@RequestMapping(value="reviewSelectAll", method=RequestMethod.GET)
	public String reviewSelectAll(ReviewVO rvo, Model model) {

		logger.info("ReviewController reviewSelectAll() 함수진입 >>> : ");
		logger.info("ReviewController reviewSelectAll rvo.getCrnum() : " + rvo.getCrnum());
		logger.info("ReviewController reviewSelectAll rvo.getCrsubject() : " + rvo.getCrsubject());
		logger.info("ReviewController reviewSelectAll rvo.getCrscore() : " + rvo.getCrscore());
		logger.info("ReviewController reviewSelectAll rvo.getCrmemo() : " + rvo.getCrmemo());
		logger.info("ReviewController reviewSelectAll rvo.getCrreport() : " + rvo.getCrreport());
		
		// 페이징 변수 세팅
		int pageSize = CommonUtils.REVIEW_PAGE_SIZE;
		int groupSize = CommonUtils.REVIEW_GROUP_SIZE;
		int curPage = CommonUtils.REVIEW_CUR_PAGE;
		int totalCount = CommonUtils.REVIEW_TOTAL_COUNT;
		
		if (rvo.getCurPage() !=null) {
			curPage = Integer.parseInt(rvo.getCurPage());
		}
		
		logger.info("rvo.getKeyword >>> : " + rvo.getKeyword());
		
		rvo.setPageSize(String.valueOf(pageSize));
		rvo.setGroupSize(String.valueOf(groupSize));
		rvo.setCurPage(String.valueOf(curPage));
		rvo.setTotalCount(String.valueOf(totalCount));
		
		logger.info("ReviewController reviewPaging() rvo.getPageSize() : " + rvo.getPageSize());
		logger.info("ReviewController reviewPaging() rvo.getGroupSize() : " + rvo.getGroupSize());
		logger.info("ReviewController reviewPaging() rvo.getCurPage() : " + rvo.getCurPage());
		logger.info("ReviewController reviewPaging() rvo.getTotalCount() : " + rvo.getTotalCount());
		
		List<ReviewVO> listAll = reviewService.selectAllReview(rvo);
		logger.info("ReviewController selectAllReview listAll.size() >>> : " + listAll.size());
		
		if(listAll.size() >= 0) {
			
			model.addAttribute("reviewPagingBVO", rvo);
			model.addAttribute("listAll", listAll);
			return "review/reviewSelectAll";
			
		}
		
		return "review/reviewInsertForm";
	}
	
	// 아이디 검섹 페이징
	@RequestMapping(value="reviewSelectAllserch", method=RequestMethod.GET)
	public String reviewSelectAllserch(ReviewVO rvo, Model model, HttpServletRequest req) {
		
		logger.info("ReviewController reviewSelectAllserch() 함수 진입>>>:");
		
		String keyword = null;
		keyword = req.getParameter("keyword");
		
		// set으로 저장해서 get으로 출력
		rvo.setMid(rvo.getMid());
		logger.info("reviewSelectAllserch keyword >>> : " + keyword);
		keyword.toUpperCase();
		rvo.getKeyword();
		
		logger.info("rvo.getKeyword >>> : " + rvo.getKeyword());
		logger.info("ReviewController reviewSelectAllserch rvo.getCrnum() : " + rvo.getCrnum());
		logger.info("ReviewController reviewSelectAllserch rvo.getMid() : " + rvo.getMid());
		logger.info("ReviewController reviewSelectAllserch rvo.getCrsubject() : " + rvo.getCrsubject());
		logger.info("ReviewController reviewSelectAllserch rvo.getCrscore() : " + rvo.getCrscore());
		logger.info("ReviewController reviewSelectAllserch rvo.getCrmemo() : " + rvo.getCrmemo());
		logger.info("ReviewController reviewSelectAllserch rvo.getCrreport() : " + rvo.getCrreport());
		
		// 페이징 변수 세팅
		int pageSize = CommonUtils.REVIEW_PAGE_SIZE;
		int groupSize = CommonUtils.REVIEW_GROUP_SIZE;
		int curPage = CommonUtils.REVIEW_CUR_PAGE;
		int totalCount = CommonUtils.REVIEW_TOTAL_COUNT;
		
		if (rvo.getCurPage() !=null) {
			curPage = Integer.parseInt(rvo.getCurPage());
		}
		
		rvo.setPageSize(String.valueOf(pageSize));
		rvo.setGroupSize(String.valueOf(groupSize));
		rvo.setCurPage(String.valueOf(curPage));
		rvo.setTotalCount(String.valueOf(totalCount));
		
		logger.info("ReviewController reviewPaging() rvo.getPageSize() : " + rvo.getPageSize());
		logger.info("ReviewController reviewPaging() rvo.getGroupSize() : " + rvo.getGroupSize());
		logger.info("ReviewController reviewPaging() rvo.getCurPage() : " + rvo.getCurPage());
		logger.info("ReviewController reviewPaging() rvo.getTotalCount() : " + rvo.getTotalCount());
		
		List<ReviewVO> listAllserch = reviewService.selectAllReview(rvo);
		logger.info("ReviewController selectAllReview listAllserch.size() >>> : " + listAllserch.size());
		
		if(listAllserch.size() >= 0) {
			
			model.addAttribute("reviewPagingBVO", rvo);
			model.addAttribute("listAllserch", listAllserch);
			return "review/reviewSelectAll";
			
		}
		
		return "review/reviewSelectAll";
	}
	
	// 조건조회
	@RequestMapping(value="reviewSelect", method=RequestMethod.GET)
	public String reviewSelect(Principal principal, ReviewVO rvo, Model model, HttpSession session) {
		
		logger.info("ReviewController reviewSelect() 함수진입 >>> : ");
//		
//		String mid = principal.getName();
//		
//		logger.info("mid >>> " + mid);
//		
//		List<Member> listR = reviewService.selectRwriter(rvo);
//		logger.info("ReviewController review`	Select listR.size() >>> : " + listR.size());
//		
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
	
	// 수정하기 폼에서 수정하기 버튼 누르기
	@RequestMapping(value="reviewUpdate_1", method=RequestMethod.GET)
	public String reviewUpdate_1(ReviewVO rvo, Model model) {
		
		logger.info("ReviewController reviewUpdate_1() 함수진입 >>> : ");
		
		logger.info("ReviewController reviewUpdate_1 rvo.getCrnum() >>> : " + rvo.getCrnum());
		logger.info("ReviewController reviewUpdate_1 rvo.getCrscore() >>> : " + rvo.getCrscore());
		logger.info("ReviewController reviewUpdate_1 rvo.getCrmemo() >>> : " + rvo.getCrmemo());
		logger.info("ReviewController reviewUpdate_1 rvo.getUpdatedate() >>> : " + rvo.getUpdatedate());
		
		int nCnt = reviewService.updateReview(rvo);
		logger.info("ReviewController reviewUpdate_1 nCnt >>> : " + nCnt);
		
		if (nCnt > 0) {return "review/reviewUpdate";}
		
		return "review/reviewUpdateForm";
	}
	
	// 조건조회에서 삭제버튼을 눌렀을 때
	@RequestMapping(value="reviewDelete", method=RequestMethod.GET)
	public String reviewDelete(ReviewVO rvo, Model model) {
		
		logger.info("ReviewController reviewDelete() 함수진입 >>> : ");
		
		logger.info("ReviewController reviewDelete rvo.getCrnum() >>> : " + rvo.getCrnum());
		
		int nCnt = reviewService.deleteReview(rvo);
		logger.info("ReviewController reviewDelete nCnt >>> : " + nCnt);
		
		if (nCnt > 0) {return "review/reviewDelete";}
		
		return "review/reviewSelect";
	}
}
