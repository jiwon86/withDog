package a.b.c.com.agency.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import a.b.c.com.agency.service.AgencyService;
import a.b.c.com.agency.service.ConditionService;
import a.b.c.com.agency.service.OfferService;
import a.b.c.com.agency.vo.AgencyVO;
import a.b.c.com.agency.vo.ConditionVO;
import a.b.c.com.agency.vo.OfferVO;
import a.b.c.com.common.CommonUtils;
import a.b.c.com.member.service.MemberService;
import a.b.c.com.member.vo.MemberVO;
import a.b.c.com.pet.vo.PetVO;

@Controller
public class OfferController {

	private Logger logger = Logger.getLogger(OfferController.class);
	
	private MemberService memberService;
	private OfferService offerService;
	private ConditionService conditionService;
	private AgencyService agencyService;
	
	@Autowired(required=false)
	public OfferController(MemberService memberService, OfferService offerService, 
						   ConditionService conditionService, AgencyService agencyService) {
		this.memberService = memberService;
		this.offerService = offerService;
		this.conditionService = conditionService;
		this.agencyService = agencyService;
	}
	
	/*
	@GetMapping("/offerSelectAll")
	public String offerSelectAll(Principal principal, Model model) {
		
		String mno = null;
		Map<String, Object> petMap;
		
		// 세션을 통해 멤버번호를 가져오기
		if(principal != null) {
			String mid = principal.getName();
			
			Member member = memberService.memberSelect(mid);
			mno = member.getMno();
			model.addAttribute("mno", mno);
		}
		
		if(mno != null) {
			// 신청 리스트
			List<OfferVO> offerListAll = offerService.offerSelectAll(mno);
			model.addAttribute("offerListAll", offerListAll);
			
			petMap = new HashMap<>();
			
			// 동물 리스트
			for(int i=0; i<offerListAll.size(); i++) {
				OfferVO ovo = offerListAll.get(i);
				String pno = ovo.getPno();
				String[] pnoArr = pno.split(" ");
				
				Map<String, Object> offerMap = new HashMap<>();
				offerMap.put("pnoArr", pnoArr);
				offerMap.put("mno", mno);
				
				List<PetVO> PetListAll = offerService.petSelectAll(offerMap);
				
				List<PetVO> petList = new ArrayList<>();
				
				for(int j=0; j<PetListAll.size(); j++) {
					PetVO p = PetListAll.get(j);					
					
					petList.add(p);
				}
				
				petMap.put(ovo.getTno() , petList);
			}
			
			model.addAttribute("petMap", petMap);
		}
		
		return "agency/offerSelectAll";
	}
	*/
	
	@GetMapping("/offerSelectAllPaging")
	public String offerSelectAllPaging(OfferVO offerVO, Principal principal, Model model) {
		
		String mno = null;
		Map<String, Object> petMap;
		MemberVO mvo = null;
		
		// 세션을 통해 멤버번호를 가져오기
		if(principal != null) {
			mvo = new MemberVO();
			
			String mid = principal.getName();
			mvo.setMid(mid);
			
			List<MemberVO> member = memberService.memberSelect(mvo);
			mvo = member.get(0);
			
			mno = mvo.getMno();
			model.addAttribute("mno", mno);
		}
		
		int pageSize = CommonUtils.OFFER_PAGE_SIZE;
		int groupSize = CommonUtils.OFFER_GROUP_SIZE;
		int curPage = CommonUtils.OFFER_CUR_PAGE;
		int totalCount = CommonUtils.OFFER_TOTAL_COUNT;		
		
		if(offerVO.getCurPage() != null) {
			curPage = Integer.parseInt(offerVO.getCurPage());
		}
		
		offerVO.setPageSize(String.valueOf(pageSize));
		offerVO.setGroupSize(String.valueOf(groupSize));
		offerVO.setCurPage(String.valueOf(curPage));
		offerVO.setTotalCount(String.valueOf(totalCount));
		offerVO.setMno(String.valueOf(mno));
		
		logger.info("offerVO.getPageSize() >>> : " + offerVO.getPageSize());
		logger.info("offerVO.getGroupSize() >>> : " + offerVO.getGroupSize());
		logger.info("offerVO.getCurPage() >>> : " + offerVO.getCurPage());
		logger.info("offerVO.getTotalCount() >>> : " + offerVO.getTotalCount());
		logger.info("offerVO.getTotalCount() >>> : " + offerVO.getMno());
		
		if(mno != null) {
			model.addAttribute("pagingOfferVO", offerVO);
			// 신청 리스트
			List<OfferVO> offerListAll = offerService.offerSelectAll(offerVO);
			model.addAttribute("offerListAll", offerListAll);
					
			petMap = new HashMap<>();
			
			// 동물 리스트
			for(int i=0; i<offerListAll.size(); i++) {
				OfferVO ovo = offerListAll.get(i);
				String pno = ovo.getPno();
				String[] pnoArr = pno.split(" ");
				
				Map<String, Object> offerMap = new HashMap<>();
				offerMap.put("pnoArr", pnoArr);
				offerMap.put("mno", mno);
				
				List<PetVO> petListAll = offerService.petSelectAll(offerMap);
				
				List<PetVO> petList = new ArrayList<>();
				
				for(int j=0; j<petListAll.size(); j++) {
					PetVO pvo = petListAll.get(j);					
					
					petList.add(pvo);
				}
				
				petMap.put(ovo.getTno() , petList);
			}
			
			model.addAttribute("petMap", petMap);
		}
		
		return "offer/offerSelectAll";
	}	
	
	@GetMapping("/offerSelect")
	public String offerSelect(Principal principal, Model model, String tno) {
		
		String mno = null;
		
		// 세션을 통해 멤버번호를 가져오기
		if(principal != null) {
			String mid = principal.getName();
			MemberVO _mvo = null;
			_mvo = new MemberVO();
			
			_mvo.setMid(mid);
			
			List<MemberVO> memberList = memberService.memberSelect(_mvo);
			mno = memberList.get(0).getMno();
			model.addAttribute("mno", mno);
		}
		
		if(mno != null) {
			// 반려동물 신청 정보 가져오기
			OfferVO _ovo = new OfferVO();
			
			_ovo.setMno(mno);
			_ovo.setTno(tno);
			
			// 반려동물 신청 상세보기 정보
			List<OfferVO> offerList = offerService.offerSelect(_ovo);
			model.addAttribute("offerList", offerList);
			
			OfferVO ovo = offerList.get(0);
			
			// 반려동물 리스트 정보
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

			model.addAttribute("petList", petList);

			// 조건제시 정보 가져오기		
			int pageSize = CommonUtils.CONDITION_PAGE_SIZE;
			int groupSize = CommonUtils.CONDITION_GROUP_SIZE;
			int curPage = CommonUtils.CONDITION_CUR_PAGE;
			int totalCount = CommonUtils.CONDITION_TOTAL_COUNT;
			
			ConditionVO conditionVO = new ConditionVO();
			conditionVO.setTno(tno);
			
			if(conditionVO.getCurPage() != null) {
				curPage = Integer.parseInt(conditionVO.getCurPage());
			}
			
			conditionVO.setPageSize(String.valueOf(pageSize));
			conditionVO.setGroupSize(String.valueOf(groupSize));
			conditionVO.setCurPage(String.valueOf(curPage));
			conditionVO.setTotalCount(String.valueOf(totalCount));
			
			List<ConditionVO> conditionList = conditionService.conditionSelectAll(conditionVO);
			List<Integer> agencyListAnoCount = new ArrayList<>();
			List<String> agencyListMatchyn = new ArrayList<>();
			for(int i=0; i<conditionList.size(); i++) {
				String cno = conditionList.get(i).getCno();
				
				AgencyVO _avo = new AgencyVO();
				_avo.setTno(tno);
				_avo.setCno(cno);
				
				int anoCount = agencyService.agencySelectCount(_avo);
				
				if(anoCount > 0) {
					String matchyn = agencyService.agencyMatchyn(_avo).get(0).getMatchyn();
					
					agencyListMatchyn.add(matchyn);
				} else {
					agencyListMatchyn.add("N");
				}
				
				agencyListAnoCount.add(anoCount);
			}
			
			model.addAttribute("agencyListMatchyn", agencyListMatchyn);
			model.addAttribute("agencyListAnoCount", agencyListAnoCount);
			model.addAttribute("pagingConditionVO", conditionVO);
			model.addAttribute("conditionList", conditionList);
		}
		
		return "offer/offerSelect";
	}
	
	@GetMapping("/conditionSelect")
	public String conditionSelect(ConditionVO cvo, Model model) {
		ConditionVO conditionVO = new ConditionVO();
		
		String cno = cvo.getCno();
		conditionVO.setCno(cno);

		
		List<ConditionVO> conditionList = conditionService.conditionSelect(conditionVO);
		List<Integer> agencyListAnoCount = new ArrayList<>();
		List<String> agencyListMatchyn = new ArrayList<>();
		
		String tno = conditionList.get(0).getTno();
		conditionVO.setTno(tno);
		
		AgencyVO _avo = new AgencyVO();
		_avo.setCno(cno);
		_avo.setTno(tno);
		
		int anoCount = agencyService.agencySelectCount(_avo);
		
		if(anoCount > 0) {
			String matchyn = agencyService.agencyMatchyn(_avo).get(0).getMatchyn();
			
			agencyListMatchyn.add(matchyn);
		} else {
			agencyListMatchyn.add("N");
		}
		
		agencyListAnoCount.add(anoCount);
		
		model.addAttribute("agencyListMatchyn", agencyListMatchyn);
		model.addAttribute("agencyListAnoCount", agencyListAnoCount);
		model.addAttribute("conditionList", conditionList);
		
		return "offer/conditionSelect";
	}
	
}
