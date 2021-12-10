package a.b.c.com.qna.controller;

import java.security.Principal;
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

import a.b.c.com.common.ChabunUtil;
import a.b.c.com.common.CommonUtils;
import a.b.c.com.common.FileUploadUtil;
import a.b.c.com.common.service.ChabunService;
import a.b.c.com.qna.service.QnaService;
import a.b.c.com.qna.vo.QnaVO;

@Controller
public class QnaController {
	Logger logger = Logger.getLogger(QnaVO.class);
	
	private QnaService qnaService;
	private ChabunService chabunService;
	
	//생성자 Autowired
	@Autowired(required=false)
	public QnaController(QnaService qnaService, 
						 ChabunService chabunService) {
		
		this.qnaService = qnaService;
		this.chabunService = chabunService;
	}
	
	//Q&A 글 입력 폼
	@RequestMapping(value="qnaForm", method=RequestMethod.GET)
	public String qnaForm() {
		return "qna/qnaForm";
	}
	
	//글쓰기(qnaInsert-qnaSelectAll-qnaForm)
	@RequestMapping(value="qnaInsert", method=RequestMethod.POST)
	public String qnaInsert(HttpServletRequest req ,Principal principal) {
		//String mid = principal.getName();Principal principal
		logger.info("QnaController.qnaInsert 함수 진입 >>> : ");
		
		//채번 구하기 
		String qnanum = ChabunUtil.getQnaChabun("N", chabunService.getQnaChabun().getQnanum());
//		String qnanum = chabunService.getQnaChabun().getQnanum();
		logger.info("QnaController.qnaInsert qnanum >>> : " + qnanum);
		//logger.info("qnanum datatype >>> : " + qnanum.getClass().getName());
		
		//이미지 업로드
		FileUploadUtil fu = new FileUploadUtil(CommonUtils.QnA_IMG_UPLOAD_PATH,
											   CommonUtils.QnA_IMG_FILE_SIZE,
											   CommonUtils.QnA_EN_CODE);
		
		// 이미지 파일 원본 사이즈 크기 조절 하기 
		boolean bool = fu.imgfileUpload(req);
		logger.info("QnaController.qnaInsert bool >>> : " + bool);
		
		//채번, 이미지 업로드 성공하면 VO 세팅하기
		QnaVO _qvo = null;
		_qvo = new QnaVO();
		
		_qvo.setQnanum(qnanum);
		logger.info("req.getparameter >>> : " + req.getParameter("qnmanum"));
		
		_qvo.setQnatitle(fu.getParameter("qnatitle"));
		_qvo.setQnacon(fu.getParameter("qnacon"));
		
		_qvo.setQnawriter(principal.getName());
		_qvo.setQnapw(fu.getParameter("qnapw"));
		_qvo.setQnaanswer(fu.getParameter("qnaanswer"));
		_qvo.setQnafile(fu.getParameter("qnafile"));
		int nCnt = qnaService.qnaInsert(_qvo);	
		
		if(nCnt > 0) {return "qna/qnaInsert";}
		
		return "qna/qnaSelectAllForm";
		
	}
	
	//글 목록 페이징 조회
	@RequestMapping(value="qnaSelectAllPaging", method=RequestMethod.GET)
	public String qnaSelectAllPaging(QnaVO qvo, Model model) {
		logger.info("QnaController qnaSelectAllPaging 함수 진입 >>> : ");
		logger.info("QnaController qnaSelectAllPaging 함수 진입 >>> : 페이징 관련 로그 ===========");

		//페이징 변수 셋팅
		int pageSize = CommonUtils.QnA_PAGE_SIZE;  //10
		int groupSize = CommonUtils.QnA_GROUP_SIZE;  //5
		int curPage = CommonUtils.QnA_CUR_PAGE; //1
		int totalCount = CommonUtils.QnA_TOTAL_COUNT; //0 

		if(qvo.getCurPage() != null) {
			curPage = Integer.parseInt(qvo.getCurPage());
		}

		qvo.setPageSize(String.valueOf(pageSize));
		qvo.setGroupSize(String.valueOf(groupSize));
		qvo.setCurPage(String.valueOf(curPage));
		qvo.setTotalCount(String.valueOf(totalCount));

		List<QnaVO> listAll = qnaService.qnaSelectAllPaging(qvo);
		QnaVO sqsvo = (QnaVO)listAll.get(0);
		logger.info("QnaController qnaSelectAllPaging listAll.size() >>> : " + listAll.size());

		if(listAll.size()>0) {

			for(int i=0; i<listAll.size(); i++) {
				QnaVO sqvo = (QnaVO)listAll.get(i);
				System.out.println(sqvo.getQnanum());
			}

			model.addAttribute("pagingQVO", qvo);
			model.addAttribute("listAll", listAll);

			return "qna/qnaSelectAllForm";
		}

		return "qna/qnaSelectAllForm";
	}
	
	
	
	 // 글 목록 조회
	 @RequestMapping(value="qnaSelectAll", method=RequestMethod.GET) 
	 public String qnaSelectAll(@ModelAttribute QnaVO qvo, Model model) {
	 
	 List<QnaVO> listAll = qnaService.qnaSelectAll(qvo);
	 logger.info("QnaController qnaSelectAll listAll.size() >>> : " +
	 listAll.size());
	 
	 if (listAll.size() > 0) {
	 
	 model.addAttribute("listAll", listAll); return "qna/qnaSelectAllForm"; }
	 
	 return "qna/qnaForm"; }
	 
	
	
	//게시글 수정/삭제 글 조회
	@RequestMapping(value="qnaSelect", method=RequestMethod.GET)
	public String qnaSelect(String qnanum, Model model,Principal principal) {
		//String mid = principal.getName();
		logger.info("QnaController qnaSelect 함수 진입 >>> : " );
		
		 List<QnaVO> listS = qnaService.qnaSelect(qnanum);
		 logger.info("QnaController qnaSelect listS.size() >>> : " + listS.size());
		 

		 if(listS.size() == 1) {
			 model.addAttribute("listS", listS);
			 return "qna/qnaSelect";
		 }
		
		return "qna/qnaSelect";
	}
	
	@RequestMapping("qnaMyUpdate")
	public String qnaMyUpdate(QnaVO qvo, Model model) {
		logger.info("QnaController qnaMyUpdate 함수 진입 >>> : " );
		logger.info("QnaController qnaMyUpdate qvo.getQnanum >>> : " + qvo.getQnanum());
		
		int nCnt = qnaService.qnaMyUpdate(qvo);
		logger.info("QnaController qnaMyUpdate nCnt >>> : " + nCnt);
		
		if(nCnt > 0) { return "qna/qnaUpdate"; } 
		
		return "qna/qnaSelectAllForm"; 
	}
	
	//selectAll 에서 삭제
	@RequestMapping("qnaMyDelete")
	public String qnaMyDelete(QnaVO qvo, Model model) {
		logger.info("QnaController qnaMyDelete 함수 진입 >>> : ");
		
		int nCnt = qnaService.qnaMyDelete(qvo);
		
		if(nCnt > 0) {
			logger.info("QnaController qnaMyDelete nCnt 값 >>> " + nCnt);
			
			return "qna/qnaDelete";
		}
		return "qna/qnaSelectAllForm";
	}
	
	@RequestMapping("qnaSee")
	public String qnaSee(String qnanum, Model model) {
		logger.info("QnaController qnaSee 함수 진입 >>> : ");
		logger.info("QnaController qnaSee qqnanum >>> : " + qnanum);

		
		List<QnaVO> listS = qnaService.qnaSelect(qnanum);
		 logger.info("QnaController qnaSelect listS.size() >>> : " + listS.size());
		 QnaVO qvo = listS.get(0);
		 System.out.println(qvo.getQnainsertdate());
		 
		 if(listS.size() == 1) {
			 model.addAttribute("listS", listS);
			 return "qna/qnaSee";
		 }
		 return "qna/qnaSelectAllForm";
	}
	
	@RequestMapping(value="qnaanswer", method=RequestMethod.POST)
	@ResponseBody
	public Object qnaanswer(QnaVO qvo) {
		List<QnaVO> list = qnaService.qnaanswer(qvo);
		
		String msg = "";
		if(list.size() == 0) {msg="qnaanswer_pre";}
		else {msg = "qnaanswer_suc";}
		
		return msg;
	}
}
