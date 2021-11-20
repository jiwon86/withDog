package a.b.c.com.notice.controller;

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
	public String noticeInsert_a() {
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
	
	@RequestMapping("noticeSelect")
	public String noticeSelect() {
		return "notice/noticeSelect";
	}

	// 공지사항 글 입력 폼
	@RequestMapping(value="noticeForm", method=RequestMethod.GET)
	public String noticeForm() {
		return "notice/noticeForm";
	}

	// 공지사항 작성하기
	@RequestMapping(value="noticeInsert", method=RequestMethod.POST)
	public String noticeInsert(HttpServletRequest req) {
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
		_nvo.setNwriter(fu.getParameter("nwriter"));
		_nvo.setNcontents(fu.getParameter("ncontents"));
		_nvo.setNfile(fu.getFileName("nfile"));
		logger.info("fu.getParameter(\"nfile\") >>> : " + fu.getParameter("nfile"));
		
		logger.info("NoticeController noticeInsert _nvo.getNnum() >>> : " + _nvo.getNnum());
		logger.info("NoticeController noticeInsert _nvo.getNcontent() >>> : " + _nvo.getNcontents());
		logger.info("NoticeController noticeInsert _nvo.getNfile() >>> : " + _nvo.getNfile());

		int nCnt = noticeService.noticeInsert(_nvo);
		logger.info("NoticeController noticeInsert nCnt >>> : " + nCnt);
		
		if(nCnt > 0) {return "notice/noticeSelectAll";}
		return "notice/noticeInsertForm";
	}
	
	
	@RequestMapping("noticeUpdate")
	public String noticeUpdate() {
		return "notice/noticeUpdate";
	}
	
	
	@RequestMapping("noticeDelete")
	public String noticeDelete() {
		return "notice/noticeDelete";
	}
	
}
