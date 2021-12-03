package a.b.c.com.qna.controller;

import java.security.Principal;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import a.b.c.com.common.ChabunUtil;
import a.b.c.com.common.service.ChabunService;
import a.b.c.com.qna.service.RqnaService;
import a.b.c.com.qna.vo.RqnaVO;

@Controller
public class RqnaController {
	Logger logger = Logger.getLogger(RqnaController.class);
	
	@Autowired(required=false)
	private RqnaService rqnaService;
	
	@Autowired(required=false)
	private ChabunService chabunService;
	
	public RqnaController(RqnaService qnaRService) {
		this.rqnaService = rqnaService;
		this.chabunService = chabunService;
	}
	
	@RequestMapping(value="rqnaForm", method= {RequestMethod.GET, RequestMethod.POST})
	public String rqnaForm() {
		logger.info("RqnaController rqnaForm >>> : ");
		return "qna/rqnaForm";
	}
	
	//댓글등록
	@RequestMapping(value="rqnaInsert", method=RequestMethod.POST)
	@ResponseBody
	public String rqnaInsert(RqnaVO rqvo, Principal principal) {
		//logger.info("RqnaController rqnaInsert >>> : ");
		logger.info("RqnaController rqnaInsert rqvo.getQnanum() >>> : " + rqvo.getQnanum());
		logger.info("RqnaController rqnaInsert rqvo.getRqnacon() >>> : " + rqvo.getRqnacon());
		
		String rqnanum = ChabunUtil.getRqnaChabun("N", chabunService.getRqnaChabun().getRqnanum());
		logger.info("RqnaController rqnaInsert rqnanum >>> : " + rqnanum);
		
		rqvo.setRqnanum(rqnanum);
		rqvo.setRqnawriter(principal.getName());
		int nCnt = rqnaService.rqnaInsert(rqvo);
		logger.info("RqnaController rqnaInsert nCnt >>> : " + nCnt);
		
		if(1 == nCnt) {return "GOOD";}
		else {return "BAD";}
		
	}
	
	//댓글조회
	@RequestMapping(value="rqnaSelect", method=RequestMethod.POST)
	@ResponseBody
	public String rqnaSelect(RqnaVO rqvo) {
		logger.info("RqnaController rqnaSelect >>> : ");
		logger.info("RqnaController rqnaSelect rqvo.getRqnanum() >>> : " + rqvo.getRqnanum());
		
		List<RqnaVO> list = rqnaService.rqnaSelect(rqvo);
		logger.info("RqnaController rqnaSelect list >>> : " +list);
		
		String listStr = list.get(0).getRqnanum()
				+","+list.get(0).getRqnatitle()
				+","+list.get(0).getRqnacon()
				+","+list.get(0).getRqnainsertdate();
		return listStr;
	}
	
	// 댓글 조회	
	@RequestMapping(value="rqnaSelectAll", method=RequestMethod.POST, produces = "application/text; charset=utf-8")
	@ResponseBody
	public String rqnaSelectAll(RqnaVO rqvo) {	
		logger.info("RqnaController rqnaSelectAll() 함수진입 >>> : ");
		// rbvo.setSbnum("B0001");
		logger.info("RqnaController rqnaSelectAll rqvo.getRqnanum() >>> : " + rqvo.getRqnanum());
		
		List<RqnaVO> list  = rqnaService.rqnaSelectAll(rqvo);
		logger.info("RqnaController rqnaSelectAll list >>> : " + list);
		
		String ss = "";
		String listStr = "";
		for (int i=0; i < list.size(); i++) {
			RqnaVO _rbvo = list.get(i);
			String s0 = _rbvo.getRqnanum();
			String s1 = _rbvo.getRqnatitle();
			String s2 = _rbvo.getRqnacon();
			String s3 = _rbvo.getRqnainsertdate();
			ss = s0+","+s1+","+s2+","+s3;
			listStr += ss+"&";
		}
		return listStr;
	}
	

	//댓글 삭제
	@RequestMapping(value="rqnaDelete", method=RequestMethod.POST)
	@ResponseBody
	public String rqnaDelete(RqnaVO rqvo) {
		logger.info("RqnaController rqnaDelete >>> : ");
		logger.info("RqnaController rqnaDelete rqvo.getRqnanum() >>> : " + rqvo.getRqnanum());
		
		int nCnt = rqnaService.rqnaDelete(rqvo);
		logger.info("RqnaController rboardDelete nCnt >>> : " + nCnt);
		
		if(1 == nCnt) {return "GOOD";}
		else {return "BAD";}
	}
	
}
