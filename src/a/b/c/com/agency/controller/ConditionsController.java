package a.b.c.com.agency.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sun.istack.internal.logging.Logger;

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
public class ConditionsController {
	
	private Logger logger = Logger.getLogger(ConditionsController.class);
	
	private ConditionService conditionService;
	private MemberService memberService;
	private OfferService offerService;
	private AgencyService agencyService;
	
	@Autowired(required = false)
	public ConditionsController(ConditionService conditionService, MemberService memberService, 
							   OfferService offerService, AgencyService agencyService) {
		this.conditionService = conditionService;
		this.memberService = memberService;
		this.offerService = offerService;
		this.agencyService = agencyService;
	}
	
	@GetMapping("/myConditionSelectAllPaging")
	public String myConditionSelectAllPaging(ConditionVO conditionVO, Principal principal, Model model) {
		
		String mno = null;
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
		
		int pageSize = CommonUtils.CONDITION_PAGE_SIZE;
		int groupSize = CommonUtils.CONDITION_GROUP_SIZE;
		int curPage = CommonUtils.CONDITION_CUR_PAGE;
		int totalCount = CommonUtils.CONDITION_TOTAL_COUNT;	
		
		if(conditionVO.getCurPage() != null) {
			curPage = Integer.parseInt(conditionVO.getCurPage());
		}
		
		conditionVO.setPageSize(String.valueOf(pageSize));
		conditionVO.setGroupSize(String.valueOf(groupSize));
		conditionVO.setCurPage(String.valueOf(curPage));
		conditionVO.setTotalCount(String.valueOf(totalCount));
		conditionVO.setMno(mno);
		
		logger.info("*** 페이징 >>> : " + conditionVO.getPageSize());
		logger.info("*** 페이징 >>> : " + conditionVO.getGroupSize());
		logger.info("*** 페이징 >>> : " + conditionVO.getCurPage());
		logger.info("*** 페이징 >>> : " + conditionVO.getTotalCount());
		
		if(mno != null) {
			List<ConditionVO> conditionListAll = conditionService.myConditionSelectAll(conditionVO);
			List<Integer> agencyListAnoCount = new ArrayList<>();
			List<String> agencyListMatchyn = new ArrayList<>();
			
			for(int i=0; i<conditionListAll.size(); i++) {
				String tno = conditionListAll.get(i).getTno();
				String cno = conditionListAll.get(i).getCno();
				
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
			model.addAttribute("conditionListAll", conditionListAll);
		}
		
		return "condition/conditionSelectAll";
	}
	
	@GetMapping("/myConditionSelect")
	public String myConditionSelect(String cno, Principal principal, Model model) {
		
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
			ConditionVO _cvo = new ConditionVO();
			
			_cvo.setMno(mno);
			_cvo.setCno(cno);
			
			List<ConditionVO> conditionList = conditionService.conditionSelect(_cvo);
			List<Integer> agencyListAnoCount = new ArrayList<>();
			List<String> agencyListMatchyn = new ArrayList<>();
			
			String tno = conditionList.get(0).getTno();
			
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
			
			model.addAttribute("agencyListMatchyn", agencyListMatchyn);
			model.addAttribute("agencyListAnoCount", agencyListAnoCount);
			model.addAttribute("conditionList", conditionList);
		}
		
		return "condition/conditionSelect";
	}	
	
	@GetMapping(value="/offerSelectAjax", produces="application/text; charset=utf-8")
	@ResponseBody
	public String offerSelectAjax(OfferVO offerVO) {
		List<OfferVO> offerListAll = conditionService.offerSelectAjax(offerVO);
		
		JSONObject obj = null;
		obj = new JSONObject();
		OfferVO ovo = offerListAll.get(0);
		
		// 반려동물 정보 가져오기
		String pno = ovo.getPno();
		String[] pnoArr = pno.split(" ");
		String mno = offerVO.getMno();
			
		Map<String, Object> offerMap = new HashMap<>();
		offerMap.put("pnoArr", pnoArr);
		offerMap.put("mno", mno);
		
		List<PetVO> petListAll = conditionService.petSelect(offerMap);
		
		JSONArray petArr = new JSONArray();
		for(int j=0; j<petListAll.size(); j++) {
			PetVO pvo = petListAll.get(j);
			System.out.println("*** 펫 이름 >>> : " + pvo.getPname());
			
			JSONObject petObj = null;
			petObj = new JSONObject();
			
			petObj.put("pname", pvo.getPname());
			petObj.put("ptype", pvo.getPtype());
			petObj.put("pgender", pvo.getPgender());
			petObj.put("pneutral", pvo.getPneutral());
			petObj.put("pphoto", pvo.getPphoto());
			petObj.put("pweight", pvo.getPweight());
			petObj.put("pmemo", pvo.getPmemo());
			petObj.put("pages", pvo.getPages());
			
			petArr.add(petObj);
		}
		
		// JSON문자열로 만들기 위해 신청정보 Map형태로 만들기
		obj.put("tno", ovo.getTno());
		obj.put("mid", ovo.getMid());
		obj.put("mname", ovo.getMname());
		obj.put("tlag", ovo.getTlat());
		obj.put("tlng", ovo.getTlng());
		obj.put("startdate", ovo.getStartdate());
		obj.put("enddate", ovo.getEnddate());
		obj.put("tprice", ovo.getTprice());
		obj.put("tcontent", ovo.getTcontent());
		obj.put("petArr", petArr);

		
		String result = obj.toString();
		System.out.println("json문자열 >>> :  \n " + result);
		
		return result;
	}
}
