package a.b.c.com.park.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import a.b.c.com.common.ChabunUtil;
import a.b.c.com.common.service.ChabunService;
import a.b.c.com.park.service.RparkService;
import a.b.c.com.park.vo.RparkVO;

@Controller
public class RparkController {
	Logger logger = Logger.getLogger(RparkController.class);
	
	@Autowired(required=false)
	private RparkService rparkService;
	
	@Autowired(required=false)
	private ChabunService chabunService;
	
	public RparkController(RparkService rparkService,
							ChabunService chabunService) {
		this.rparkService = rparkService;
		this.chabunService = chabunService;
	}
	
	@RequestMapping(value="rparkForm", method= {RequestMethod.GET, RequestMethod.POST})
	public String rparkForm() {
		logger.info("RparkController rparkForm >>> : ");
		return "park/rparkForm";
	}
	
	//댓글 등록
	@RequestMapping( value="rparkInsert", method=RequestMethod.POST)
	@ResponseBody
	public String rparkInsert(RparkVO rsvo) {
		logger.info("RparkController rparkInsert >>> : ");
		logger.info("RparkController rparkInsert rbvo.getInum() >>> : " + rsvo.getInum());
		logger.info("RparkController rparkInsert rbvo.getRicontent() >>> : " + rsvo.getRicontent());
		
		String rinum = ChabunUtil.getRparkChabun("N", chabunService.getRparkChabun().getRinum());
		logger.info("RparkController rparkInsert rinum >>> : " + rinum);
		logger.info("RparkController rparkInsert inum >>> : " + rsvo.getInum());
		logger.info("RparkController rparkInsert ricontent >>> : " + rsvo.getRicontent());
		logger.info("RparkController rparkInsert riname >>> : " + rsvo.getRiname());
		
		rsvo.setRinum(rinum);
		int nCnt = rparkService.rparkInsert(rsvo);
		logger.info("RparkController rparkInsert nCnt >>> : " + nCnt);
		
		if(1 == nCnt) {return "GOOD";}
		else {return "BAD";}
	}
	
	//댓글 조회
	@RequestMapping(value="rparkSelect", method=RequestMethod.POST)
	@ResponseBody
	public String rparkSelect(RparkVO rsvo) {
		logger.info("RparkController rparkSelect >>> : ");
		logger.info("RparkController rparkSelect rsvo.getRinum() >>> : " + rsvo.getRinum());
		
		List<RparkVO> list = rparkService.rparkSelect(rsvo);
		logger.info("RparkController rparkSelect _rbvo >>> : " + list);
		
		String listStr =    list.get(0).getRinum()
						+","+list.get(0).getRiname()
						+","+list.get(0).getRicontent()
						+","+list.get(0).getRiinsert();
		return listStr;
	}
	
	// 댓글 조회	
	@RequestMapping( value="rparkSelectAll", method=RequestMethod.POST, produces = "application/text; charset=utf-8")
	@ResponseBody
	public String rparkSelectAll(RparkVO rsvo) {	
		logger.info("RparkController rparkSelectAll() 함수진입 >>> : ");

		logger.info("RparkController rparkSelectAll rsvo.getInum() >>> : " + rsvo.getInum());
		
		List<RparkVO> list  = rparkService.rparkSelectAll(rsvo);
		logger.info("RparkController rparkSelectAll _rsvo >>> : " + list);
		
		String ss = "";
		String listStr = "";
		for (int i=0; i < list.size(); i++) {
			RparkVO _rsvo = list.get(i);
			String s0 = _rsvo.getRinum();
			String s1 = _rsvo.getRiname();
			String s2 = _rsvo.getRicontent();
			String s3 = _rsvo.getRiinsert();
			String s4 = _rsvo.getInum();
			ss = s0+","+s1+","+s2+","+s3+","+s4;
			listStr += ss+"&";
		}
		return listStr;
	}
	
	//댓글 삭제
	@RequestMapping(value="rparkDelete", method=RequestMethod.POST)
	@ResponseBody
	public String rparkDelete(RparkVO rsvo) {
		logger.info("RparkController rparkDelete >>> : ");
		logger.info("RparkController rparkDelete rsvo.getRinum() >>> : " + rsvo.getRinum());
		
		int nCnt = rparkService.rparkDelete(rsvo);
		logger.info("RparkController rparkDelete nCnt >>> : " + nCnt);
		
		if(1 == nCnt) {return "GOOD";}
		else {return "BAD";}
	}
}
