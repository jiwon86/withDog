package a.b.c.com.agency.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import a.b.c.com.agency.service.AgencyService;
import a.b.c.com.agency.vo.AgencyVO;
import a.b.c.com.common.ChabunUtil;
import a.b.c.com.common.service.ChabunService;

@Controller
public class AgencyController {
	private Logger logger = Logger.getLogger(AgencyController.class);
	
	private AgencyService agencyService;
	private ChabunService chabunService;
	
	@Autowired(required = false)
	public AgencyController(AgencyService agencyService, ChabunService chabunService) {
		this.agencyService = agencyService;
		this.chabunService = chabunService;
	}
	
	@RequestMapping("/agencyCheckAjax")
	@ResponseBody
	public void agencyCheckAjax(AgencyVO avo) {
		
		// 채번 구하기
		String ano = ChabunUtil.getAgencyChabun("m", chabunService.getAgencyChabun().getAno());
		avo.setAno(ano);
		
		logger.info("** agency ano >>> : " + ano);
		logger.info("** agency tno >>> : " + avo.getTno());
		logger.info("** agency cno >>> : " + avo.getCno());
		
		int anoCount = agencyService.agencySelectCount(avo);
		
		if(anoCount > 0) {
			// update 
			// 수락 OR 수락 해제
			List<AgencyVO> agencyList = agencyService.agencyMatchyn(avo);
			String matchyn = agencyList.get(0).getMatchyn();
			
			logger.info("*** matchyn >>> : " + matchyn);
			
			if(matchyn.equals("Y")) {
				// 수락해제버튼 누를 때
				logger.info("*** 해제버튼 누를 때 >>> : ");
				int agencyUpadate = agencyService.agencyUpdateN(avo);
			} else {
				// 수락버튼 누를 때
				logger.info("*** 수락버튼 누를 때 >>> : ");
				int agencyUpdate = agencyService.agencyUpdateY(avo);
			}
			
		} else {
			// insert
			int nCnt = agencyService.agencyInsert(avo);
			
			if(nCnt > 0) {
				logger.info("agencyInsert 성공");
			} else {
				logger.info("agencyInsert 실패");
			}
		}

	}
	
	@RequestMapping("/chatPayment")
	public String chatPayment() {
		
		return "agency/chatPayment";
	}
	
	
	
}
