package a.b.c.com.notice.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import a.b.c.com.common.ChabunUtil;
import a.b.c.com.common.CommonUtils;
import a.b.c.com.common.FileUploadUtil;
import a.b.c.com.common.service.ChabunService;
import a.b.c.com.notice.service.NoticeService;
import a.b.c.com.notice.vo.NoticeVO;


@Controller
public class NoticeController {
	Logger logger = Logger.getLogger(NoticeController.class);	
	
	private NoticeService noticeService;
	private ChabunService chabunService;
	
	// 생성자 Autowired
	@Autowired(required=false)
	public NoticeController(NoticeService noticeService
							,ChabunService chabunService) {
		this.noticeService = noticeService;
		this.chabunService = chabunService;
	}
	
	@RequestMapping("noticeInsertForm")
	public String noticeInsert_a(Principal principal, Model model) {
		String mid = principal.getName();
		
		model.addAttribute("mid", mid);
		
		return "notice/noticeInsertForm";
	}
	
	@RequestMapping("noticeSelectAll")
	public String noticeSelectAll(NoticeVO nvo, Model model) {
		
		List<NoticeVO> listAll = noticeService.noticeSelectAll(nvo);
		
		if(listAll.size() > 0) {
			model.addAttribute("listAll", listAll);
		}
		
		return "notice/noticeSelectAll";
	}
	
	// 상세조회
	@RequestMapping(value="noticeSelect", method=RequestMethod.GET)
	public String noticeSelect(NoticeVO nvo, Model model) {
		logger.info("NoticeController noticeSelect 함수 진입 >>> : ");
		logger.info("NoticeController noticeSelect nvo.getNnum() >>> : " + nvo.getNnum());
		
		List<NoticeVO> listS = noticeService.noticeSelect(nvo);
		logger.info("NoticeController noticeSelect listS.size() >>> : " + listS.size());
		
		if(listS.size() == 1) {
			model.addAttribute("listS", listS);
			return "notice/noticeSelect";
		}
		return "notice/noticeSelect";
	}

	// 공지사항 글 입력 폼
	@RequestMapping(value="noticeForm", method=RequestMethod.GET)
	public String noticeForm() {
		return "notice/noticeForm";
	}

	// 공지사항 작성하기
	@RequestMapping(value="noticeInsert", method=RequestMethod.POST)
	public String noticeInsert(HttpServletRequest req, Principal principal, Model model) {
		logger.info("NoticeController noticeInsert 함수 진입 >>> : ");
		
		// 채번
		String nnum = ChabunUtil.getNoticeChabun("N", chabunService.getNoticeChabun().getNnum());
		logger.info("NoticeController noticeInsert nnum >>> : " + nnum);
		
		// 파일 업로드
		FileUploadUtil fu = new FileUploadUtil(  CommonUtils.NOTICE_IMG_UPLOAD_PATH
												,CommonUtils.NOTICE_IMG_FILE_SIZE
												,CommonUtils.NOTICE_EN_CODE);
		
		// 파일 원본 사이즈
		// 이미지파일 원본 사이즈 크기 조절하기
		boolean bool = fu.imgfileUploadSize(req);
		logger.info("NoticeController noticeInsert bool >>> : " + bool);
		
		// 채번, 이미지 업로드 성공 후 VO세팅
		NoticeVO _nvo = null;
		_nvo = new NoticeVO();
		
		_nvo.setNnum(nnum);
		_nvo.setNsubject(fu.getParameter("nsubject"));
		_nvo.setNwriter(principal.getName());
		_nvo.setNcontents(fu.getParameter("ncontents"));
		_nvo.setNfile(fu.getFileName("nfile"));
		logger.info("fu.getParameter(\"nfile\") >>> : " + fu.getParameter("nfile"));
		
		logger.info("NoticeController noticeInsert _nvo.getNnum() >>> : " + _nvo.getNnum());
		logger.info("NoticeController noticeInsert _nvo.getNcontent() >>> : " + _nvo.getNcontents());
		logger.info("NoticeController noticeInsert _nvo.getNfile() >>> : " + _nvo.getNfile());

		int nCnt = noticeService.noticeInsert(_nvo);
		logger.info("NoticeController noticeInsert nCnt >>> : " + nCnt);
		
		if(nCnt > 0) {
			model.addAttribute("nnum", nnum);
			return "notice/noticeInsert";	
		}
		return "notice/noticeInsertForm";
	}
	
	
	@GetMapping("noticeUpdate")
	public String noticeUpdateForm(NoticeVO nvo, Model model) {
		logger.info("NoticeController noticeUpdate 함수 진입 >>> : ");
		
		logger.info("NoticeController noticeUpdate nvo.getNbnum() >>> : " + nvo.getNnum());
		logger.info("NoticeController noticeUpdate nvo.getNcontents() >>> : " + nvo.getNcontents());
		
		
		List<NoticeVO> listS = noticeService.noticeSelect(nvo);
		
		model.addAttribute("listS", listS);
		return "notice/noticeUpdateForm";
	}
	
	@PostMapping("noticeUpdate")
	public String noticeUpdate(NoticeVO nvo , Model model) {
		logger.info("noticeUpdate ----------------------------");

		
		int nCnt = noticeService.noticeUpdate(nvo);
		model.addAttribute("nnum", nvo.getNnum());
		
		logger.info("----------------------------------------------------------------------------------------------------------------------------------------------" + nCnt);
		logger.info("----------------------------------------------------------------------------------------------------------------------------------------------" + nvo.getNsubject());
		logger.info("----------------------------------------------------------------------------------------------------------------------------------------------" + nvo.getNcontents());
		
		return "notice/noticeUpdate";
	}
	
	
	@GetMapping("noticeDelete")
	public String noticeDeleteForm(NoticeVO nvo, Model model) {
		logger.info("NoticeController noticeDelete 함수 진입 >>> : ");
		
		logger.info("NoticeController noticeDelete nvo.getNbnum() >>> : " + nvo.getNnum());
		logger.info("NoticeController noticeDelete nvo.getNcontents() >>> : " + nvo.getNcontents());
		
		
		List<NoticeVO> listS = noticeService.noticeSelect(nvo);
		
		model.addAttribute("listS", listS);
		return "notice/noticeDeleteForm";
	}
	
	@PostMapping("noticeDelete")
	public String noticeDelete(NoticeVO nvo , Model model) {
		logger.info("noticeDelete ----------------------------");

		
		int nCnt = noticeService.noticeDelete(nvo);
		model.addAttribute("nnum", nvo.getNnum());
		
		return "notice/noticeDelete";
	}
	/*
	@RequestMapping(value="noticeSelectPaging", method=RequestMethod.GET)
	public String noticeSelectPaging(NoticeVO nvo, Model model) {
		logger.info("NoticeController noticePaging 함수 진입 >>> : ");
		
		logger.info("NoticeController noticePaging 함수 진입 >>> : 페이징 관련 로그 ==============================");
		
		// 페이징 변수 세팅
		int pageSize = CommonUtils.NOTICE_PAGE_SIZE;
		int groupSize = CommonUtils.NOTICE_GROUP_SIZE;
		int curPage = CommonUtils.NOTICE_CUR_PAGE;
		int totalCount = CommonUtils.NOTICE_TOTAL_COUNT;
		
		if (nvo.getCurPage() != null) {
			curPage = Integer.parseInt(nvo.getCurPage());
		}
		
		nvo.setPageSize(String.valueOf(pageSize));
		nvo.setGroupSize(String.valueOf(groupSize));
		nvo.setCurPage(String.valueOf(curPage));
		nvo.setTotalCount(String.valueOf(totalCount));
		
		logger.info("SpringNoticeController noticeSelectPaging nvo.getPageSize() >>> : " + nvo.getPageSize());
		logger.info("SpringNoticeController noticeSelectPaging nvo.getGroupSize() >>> : " + nvo.getGroupSize());
		logger.info("SpringNoticeController noticeSelectPaging nvo.getCurPage() >>> : " + nvo.getCurPage());
		logger.info("SpringNoticeController noticeSelectPaging nvo.getTotalCount() >>> : " + nvo.getTotalCount());
		
		NoticeVO.printVO(nvo);
		
		List<NoticeVO> listAll = noticeService.noticeSelectPaging(nvo);
		logger.info("NoticeController noticeSelectPaging listAll.size() >>> : " + listAll.size());
		
		if(listAll.size() > 0) {
			model.addAttribute("pagingVO", nvo);
			model.addAttribute("listAll", listAll);
			return "notice/noticeSelectPaging";
		}
		
		return "notice/noticeInsertForm";
	}
	
	*/
}
