package a.b.c.com.qna.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import a.b.c.com.qna.service.QnaService;
import a.b.c.com.common.ChabunUtil;
import a.b.c.com.common.CommonUtils;
import a.b.c.com.common.FileUploadUtil;
import a.b.c.com.common.service.ChabunService;
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
	
	//글쓰기
	@RequestMapping(value="qnaInsert", method=RequestMethod.POST)
	public String qnaInsert(HttpServletRequest req) {
		logger.info("QnaController.qnaInsert 함수 진입 >>> : ");
		
		//채번 구하기
		String qnanum = ChabunUtil.getQnaChabun("N", chabunService.getQnaChabun().getQnanum());
		logger.info("QnaController.qnaInsert qnanum >>> : " + qnanum);
		
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
	//여기부터 왜  fu.getParameter("qnatitle")인지 물어보기
		_qvo.setQnatitle(fu.getParameter("qnatitle"));
		_qvo.setQnacon(fu.getParameter("qnacon"));
		_qvo.setQnawriter(fu.getParameter("qnawriter"));
		_qvo.setQnapw(fu.getParameter("qnapw"));
		_qvo.setQnaemail(fu.getParameter("qnaemail"));
		_qvo.setQnafile(fu.getParameter("qnafile"));
		
		logger.info("QnaController.qnaInsert _qvo.getqnanum() >>> : " + _qvo.getQnanum());
		logger.info("QnaController.qnaInsert _qvo.getqnacon() >>> : " + _qvo.getQnacon());
		logger.info("QnaController.qnaInsert _qvo.getqnafile() >>> : " + _qvo.getQnafile());
		
		int nCnt = qnaService.qnaInsert(_qvo);
		logger.info("QnaController.qnaInsert nCnt >>> : " + nCnt);
		
		if(nCnt > 0) {return "qna/qnaInsert";}
		return "qna/qnaForm";
		
	}
	
	//글 목록 페이징 조회
	

}
