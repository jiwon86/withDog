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

import a.b.c.com.agency.service.OfferService;
import a.b.c.com.agency.vo.OfferVO;
import a.b.c.com.member.service.MemberService;
import a.b.c.com.member.vo.Member;
import a.b.c.com.pet.vo.PetVO;

@Controller
public class OfferController {

	private Logger logger = Logger.getLogger(OfferController.class);
	
	private MemberService memberService;
	private OfferService offerService;
	
	@Autowired(required=false)
	public OfferController(MemberService memberService, OfferService offerService) {
		this.memberService = memberService;
		this.offerService = offerService;
	}
	
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
	
	@GetMapping("/offerSelect")
	public String offerSelect(Principal principal, String tno, Model model) {
		
		String mno = null;
		
		// 세션을 통해 멤버번호를 가져오기
		if(principal != null) {
			String mid = principal.getName();
			
			Member member = memberService.memberSelect(mid);
			mno = member.getMno();
			model.addAttribute("mno", mno);
		}
		
		if(mno != null) {
			OfferVO _ovo = new OfferVO();
			
			_ovo.setMno(mno);
			_ovo.setTno(tno);
			
			List<OfferVO> offerList = offerService.offerSelect(_ovo);
			model.addAttribute("offerList", offerList);
			
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

			model.addAttribute("petList", petList);
		}
		
		return "agency/offerSelect";
	}
	
	@GetMapping("/conditionSelect")
	public String conditionSelect() {
		
		return "agency/conditionSelect";
	}
	
}
