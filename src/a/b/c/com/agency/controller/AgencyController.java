package a.b.c.com.agency.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import a.b.c.com.agency.service.AgencyService;
import a.b.c.com.agency.service.ConditionService;
import a.b.c.com.agency.service.OfferService;
import a.b.c.com.agency.vo.AgencyVO;
import a.b.c.com.agency.vo.ConditionVO;
import a.b.c.com.agency.vo.OfferVO;
import a.b.c.com.agency.vo.PayVO;
import a.b.c.com.common.ChabunUtil;
import a.b.c.com.common.service.ChabunService;
import a.b.c.com.member.service.MemberService;
import a.b.c.com.member.vo.MemberVO;
import a.b.c.com.pet.vo.PetVO;

@Controller
public class AgencyController {
	private Logger logger = Logger.getLogger(AgencyController.class);
	
	private MemberService memberService;
	private OfferService offerService;
	private ConditionService conditionService;
	private AgencyService agencyService;
	private ChabunService chabunService;
	
	@Autowired(required = false)
	public AgencyController(MemberService memberService, OfferService offerService, 
			   				ConditionService conditionService, AgencyService agencyService, 
			   				ChabunService chabunService) {
		this.memberService = memberService;
		this.offerService = offerService;
		this.conditionService = conditionService;
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
	
	@GetMapping("/chatPayment")
	public String chatPayment(Principal principal, Model model, String tno, String cno) {
		
		String mno = null;
		
		// 세션을 통해 멤버번호를 가져오기
		if(principal != null) {
			String mid = principal.getName();
			MemberVO _mvo = null;
			_mvo = new MemberVO();
			
			_mvo.setMid(mid);
			
			List<MemberVO> memberList = memberService.memberSelect(_mvo);
			mno = memberList.get(0).getMno();
			MemberVO mvo = memberList.get(0);
			model.addAttribute("mvo", mvo);
		}
		
		if(mno != null) {
			//========== 반려동물 신청 상세정보 =========
			OfferVO _ovo = new OfferVO();
			_ovo.setMno(mno);
			_ovo.setTno(tno);

			List<OfferVO> offerList = offerService.offerSelect(_ovo);
			//========== /반려동물 신청 상세정보 =========
		
			
			//========== 반려동물 리스트 ===========
			OfferVO ovo = offerList.get(0);
			String pno = ovo.getPno();
			String[] pnoArr = pno.split(" ");
			
			Map<String, Object> offerMap = new HashMap<>();
			offerMap.put("pnoArr", pnoArr);
			offerMap.put("mno", mno);
			
			List<PetVO> PetListAll = offerService.petSelectAll(offerMap);
			
			List<PetVO> petList = new ArrayList<>();
			
			for(int i=0; i<PetListAll.size(); i++) {
				PetVO p = PetListAll.get(i);					
				
				petList.add(p);
			}
			//========== /반려동물 리스트 ===========
			
			
			//========== 조건제시 상세정보 ===========
			ConditionVO _cvo = new ConditionVO();
			_cvo.setMno(mno);
			_cvo.setCno(cno);
			List<ConditionVO> conditionList = conditionService.conditionSelect(_cvo);
			//========== /조건제시 상세정보 ===========
			
			
			model.addAttribute("offerList", offerList);
			model.addAttribute("petList", petList);
			model.addAttribute("conditionList", conditionList);
		}
		
		return "agency/chatPayment";
	}
	
	@PostMapping("/payAjax")
	@ResponseBody
	public String payAjax(PayVO pvo) {
		
		// 결제 정보로 가져온 정보
		logger.info("pvo.getImpid()       >>> : " + pvo.getImpid());
		logger.info("pvo.getMerchantid()  >>> : " + pvo.getMerchantid());
		logger.info("pvo.getApplynum()    >>> : " + pvo.getApplynum());
		logger.info("pvo.getCardnumber()  >>> : " + pvo.getCardnumber());
		logger.info("pvo.getPaymethod()   >>> : " + pvo.getPaymethod());
		logger.info("pvo.getPayname()     >>> : " + pvo.getPayname());
		logger.info("pvo.getPayamount()   >>> : " + pvo.getPayamount());
		logger.info("pvo.getCardname()    >>> : " + pvo.getCardname());
		logger.info("pvo.getTno()         >>> : " + pvo.getTno());
		logger.info("pvo.getCno()		  >>> : " + pvo.getCno());	
		logger.info("pvo.getTmno()		  >>> : " + pvo.getTmno());	
		logger.info("pvo.getCmno()		  >>> : " + pvo.getCmno());	
		
		// 채번 구하기
		String payno = ChabunUtil.getAgencyChabun("m", chabunService.getPayChabun().getPayno());
		pvo.setPayno(payno);
		
		logger.info("payno >>> : " + payno);
		
		int insertResult = agencyService.payAjax(pvo);
		
		if(insertResult > 0) {
			PayVO _pvo = new PayVO();
			_pvo.setPayno(payno);
			
			List<PayVO> payList = agencyService.paySelectPayno(_pvo);
			
			OfferVO _ovo = new OfferVO();
			String tno = payList.get(0).getTno();
			_ovo.setTno(tno);
			
			int updateResult = offerService.offerUpdatePropose(_ovo);
			
			if(updateResult > 0) {
				return "success";
			}
		}
		
		return "fail";
	}
	
	
	@GetMapping("/chatPaymentResult")
	public String chatPaymentResult(Principal principal, Model model, String tno, String cno) {

		String mno = null;
		
		// 세션을 통해 멤버번호를 가져오기
		if(principal != null) {
			String mid = principal.getName();
			MemberVO _mvo = null;
			_mvo = new MemberVO();
			
			_mvo.setMid(mid);
			
			List<MemberVO> memberList = memberService.memberSelect(_mvo);
			mno = memberList.get(0).getMno();
			MemberVO mvo = memberList.get(0);
			model.addAttribute("mvo", mvo);
		}
		
		if(mno != null) {
			//========== 반려동물 신청 상세정보 =========
			OfferVO _ovo = new OfferVO();
			_ovo.setMno(mno);
			_ovo.setTno(tno);

			List<OfferVO> offerList = offerService.offerSelect(_ovo);
			//========== /반려동물 신청 상세정보 =========
		
			
			//========== 반려동물 리스트 ===========
			OfferVO ovo = offerList.get(0);
			String pno = ovo.getPno();
			String[] pnoArr = pno.split(" ");
			
			Map<String, Object> offerMap = new HashMap<>();
			offerMap.put("pnoArr", pnoArr);
			offerMap.put("mno", mno);
			
			List<PetVO> PetListAll = offerService.petSelectAll(offerMap);
			
			List<PetVO> petList = new ArrayList<>();
			
			for(int i=0; i<PetListAll.size(); i++) {
				PetVO p = PetListAll.get(i);					
				
				petList.add(p);
			}
			//========== /반려동물 리스트 ===========
			
			
			//========== 조건제시 상세정보 ===========
			ConditionVO _cvo = new ConditionVO();
			_cvo.setMno(mno);
			_cvo.setCno(cno);
			List<ConditionVO> conditionList = conditionService.conditionSelect(_cvo);
			ConditionVO cvo = conditionList.get(0);
			
			//========== /조건제시 상세정보 ===========
			
			//========== 결제 상세정보 ===========
			PayVO _payvo = new PayVO();
			_payvo.setTno(tno);
			_payvo.setCno(cno);
			_payvo.setTmno(ovo.getMno());
			_payvo.setCmno(cvo.getMno());
			List<PayVO> payList = agencyService.paySelect(_payvo);
			//========== /결제 상세정보 ===========
			
			model.addAttribute("offerList", offerList);
			model.addAttribute("petList", petList);
			model.addAttribute("conditionList", conditionList);
			model.addAttribute("payList", payList);
		}		
		
		return "agency/chatPaymentResultOffer";
	}
	
	@GetMapping("/chatPaymentResult2")
	public String chatPaymentResult2(Principal principal, Model model, String tno, String cno) {

		String mno = null;
		
		// 세션을 통해 멤버번호를 가져오기
		if(principal != null) {
			String mid = principal.getName();
			MemberVO _mvo = null;
			_mvo = new MemberVO();
			
			_mvo.setMid(mid);
			
			List<MemberVO> memberList = memberService.memberSelect(_mvo);
			mno = memberList.get(0).getMno();
			
			PayVO _pvo = new PayVO();
			_pvo.setTno(tno);
			_pvo.setCno(cno);
			_pvo.setTmno(mno);
			_pvo.setCmno(mno);
			
			List<PayVO> payList = agencyService.paySelect(_pvo);
			mno = payList.get(0).getTmno();
			
			MemberVO mvo = memberList.get(0);
			model.addAttribute("mvo", mvo);
		}
		
		if(mno != null) {
			//========== 반려동물 신청 상세정보 =========
			OfferVO _ovo = new OfferVO();
			_ovo.setMno(mno);
			_ovo.setTno(tno);

			List<OfferVO> offerList = offerService.offerSelect(_ovo);
			//========== /반려동물 신청 상세정보 =========
		
			
			//========== 반려동물 리스트 ===========
			OfferVO ovo = offerList.get(0);
			String pno = ovo.getPno();
			String[] pnoArr = pno.split(" ");
			
			Map<String, Object> offerMap = new HashMap<>();
			offerMap.put("pnoArr", pnoArr);
			offerMap.put("mno", mno);
			
			List<PetVO> PetListAll = offerService.petSelectAll(offerMap);
			
			List<PetVO> petList = new ArrayList<>();
			
			for(int i=0; i<PetListAll.size(); i++) {
				PetVO p = PetListAll.get(i);					
				
				petList.add(p);
			}
			//========== /반려동물 리스트 ===========
			
			
			//========== 조건제시 상세정보 ===========
			ConditionVO _cvo = new ConditionVO();
			_cvo.setMno(mno);
			_cvo.setCno(cno);
			List<ConditionVO> conditionList = conditionService.conditionSelect(_cvo);
			ConditionVO cvo = conditionList.get(0);
			
			//========== /조건제시 상세정보 ===========
			
			//========== 결제 상세정보 ===========
			PayVO _payvo = new PayVO();
			_payvo.setTno(tno);
			_payvo.setCno(cno);
			_payvo.setTmno(ovo.getMno());
			_payvo.setCmno(cvo.getMno());
			List<PayVO> payList = agencyService.paySelect(_payvo);
			//========== /결제 상세정보 ===========
			
			model.addAttribute("offerList", offerList);
			model.addAttribute("petList", petList);
			model.addAttribute("conditionList", conditionList);
			model.addAttribute("payList", payList);
		}		
		
		return "agency/chatPaymentResultCondition";
	}
	
	// http://localhost:8088/conditionInsertForm?tno=?&mno=?
	@GetMapping("/conditionInsertForm")
	public String conditionInsertForm(Principal principal, Model model, String tno, String mno) {

		String myMno = null;
		
		// 세션을 통해 멤버번호를 가져오기
		if(principal != null) {
			String mid = principal.getName();
			MemberVO _mvo = null;
			_mvo = new MemberVO();
			
			_mvo.setMid(mid);
			
			List<MemberVO> memberList = memberService.memberSelect(_mvo);
			myMno = memberList.get(0).getMno();
			MemberVO mvo = memberList.get(0);
			model.addAttribute("mvo", mvo);
		}
		
		if(mno != null) {
			//========== 반려동물 신청 상세정보 =========
			OfferVO _ovo = new OfferVO();
			_ovo.setMno(mno);
			_ovo.setTno(tno);

			List<OfferVO> offerList = offerService.offerSelect(_ovo);
			//========== /반려동물 신청 상세정보 =========
		
			
			//========== 반려동물 리스트 ===========
			OfferVO ovo = offerList.get(0);
			String pno = ovo.getPno();
			String[] pnoArr = pno.split(" ");
			
			Map<String, Object> offerMap = new HashMap<>();
			offerMap.put("pnoArr", pnoArr);
			offerMap.put("mno", mno);
			
			List<PetVO> PetListAll = offerService.petSelectAll(offerMap);
			
			List<PetVO> petList = new ArrayList<>();
			
			for(int i=0; i<PetListAll.size(); i++) {
				PetVO p = PetListAll.get(i);					
				
				petList.add(p);
			}
			//========== /반려동물 리스트 ===========
			
			
			model.addAttribute("offerList", offerList);
			model.addAttribute("petList", petList);
		}
		
		return "agency/conditionInsertForm";
	}	
	
	@PostMapping("/conditionInsert")
	public String conditionInsert(Principal principal, Model model, HttpServletRequest req) {
		
		String mno = null;
		
		// 세션을 통해 멤버번호를 가져오기
		if(principal != null) {
			String mid = principal.getName();
			MemberVO _mvo = null;
			_mvo = new MemberVO();
			
			_mvo.setMid(mid);
			
			List<MemberVO> memberList = memberService.memberSelect(_mvo);
			mno = memberList.get(0).getMno();
			MemberVO mvo = memberList.get(0);
			model.addAttribute("mvo", mvo);
		}
		
		String cno = ChabunUtil.getConditionChabun("m",chabunService.getConditionChabun().getCno());
		String tno = req.getParameter("tno");
		String cprice = req.getParameter("cprice");
		String ccontent = req.getParameter("ccontent");
		String czonecode = req.getParameter("czonecode");
		String croadaddress = req.getParameter("croadaddress");
		String croadaddressdetail = req.getParameter("croadaddressdetail");
		String cjibunaddress = req.getParameter("cjibunaddress");
		String caddress = croadaddress.concat(" " + croadaddressdetail);
		
		logger.info("cno >>> : " + cno);
		logger.info("tno >>> : " + tno);
		logger.info("cprice >>> : " + cprice);
		logger.info("ccontent >>> : " + ccontent);
		logger.info("czonecode >>> : " + czonecode);
		logger.info("croadaddress >>> : " + croadaddress);
		logger.info("croadaddressdetail >>> : " + croadaddressdetail);
		logger.info("cjibunaddress >>> : " + cjibunaddress);
		logger.info("caddress >>> : " + caddress);
		
		ConditionVO conditionVO = new ConditionVO();
		conditionVO.setCno(cno);
		conditionVO.setMno(mno);
		conditionVO.setTno(tno);
		conditionVO.setCprice(cprice);
		conditionVO.setCcontent(ccontent);
		conditionVO.setCaddress(caddress);
		
		int insertCnt = conditionService.conditionInsert(conditionVO);
		
		model.addAttribute("cno", cno);
		
		return "agency/conditionInsert";
	}
	
}
