package a.b.c.com.adminmember.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import a.b.c.com.adminmember.service.AdminMemberService;
import a.b.c.com.common.CommonUtils;
import a.b.c.com.member.vo.Member;
import a.b.c.com.pet.service.PetService;
import a.b.c.com.pet.vo.PetVO;

@Controller
public class AdminMemberController {
	
	
	private PetService petService;
	private AdminMemberService adminMemberService;
	
	@Autowired(required=false)
	public AdminMemberController(AdminMemberService adminMemberService, PetService petService) {
		this.adminMemberService = adminMemberService;
		this.petService = petService;
	}

	Logger logger = Logger.getLogger(AdminMemberController.class);

	@RequestMapping("AdminMemberSelectAll")
	public String memberSelect1(@ModelAttribute Member member, Model model) {
		logger.info("관리자페이지 Member 전체조회로 넘기기");
		
		List<Member> listAll = adminMemberService.AdminMemberSelectAll(member);
		
//		String mno[] = null;
//		String mname = "";
//		
//		for(int i=0; i < listAll.size(); i++) {
//			mno[i] = listAll.get(i).getMno(); 
//			logger.info("memmno 에 들어있는 값 >>> : " + mno[i]); 
//			mname = listAll.get(i).getMname();
//		}
//		
//		List<PetVO> listAll1 = petService.petSelectAll1(mno);
//
//		logger.info("셋팅 다한 listAll1 >>> : " + listAll1.size());
//		
//		for(int j=0; j<listAll.size(); j++) {
//			pvo.setMno(listAll.get(j).getMno());
//			logger.info(">>>>>>>" + pvo.getMno());
//			// 분명 여기서 로그 찍어보녀 4개 전부다 나오는데
//			logger.info("pvo>>> : " + pvo);
//		}
		
		
//		logger.info(">>>>>>>>>>>>>>>>>>" + mno);
		logger.info("member.toString() >>> : " + member.toString());
		logger.info("listAll.size() >>> : " + listAll.size());
		logger.info("dsff" + listAll.toString());
//		logger.info("petVO 관련 >>> : " + listAll1.toString());
//		logger.info("list.get(0).getMno >>>.>>>>" + listAll1.get(0).getMno());
		logger.info("list.get(1).getMno >>>.>>>>" + listAll.get(1).getMno());
//		logger.info("ddddd>>>>>>>>> : " + listAll.);
//		logger.info("listAll1 의 사이즈  >>> ::: : " + listAll1.size());
//		logger.info("memmno, mname >>> : " + mno);
//		logger.info("memmno, mname >>> : " + mname);
		
		
		if(listAll.size() > 0) {
			model.addAttribute("listAll",listAll);
//			model.addAttribute("listAll1", listAll1);
			return "admin/AdminMemberSelectAll";
		}else {
		
		return "admin/AdminMemberSelectAll";
		}
	}
		
	
		
	
	/*
	@RequestMapping("AdminProfile")
	public String AdminProfile(@ModelAttribute Member member, Model model, HttpServletRequest req) {
		String mno = req.getParameter("mno");
		
		
		logger.info("관리자페이지에서  수정하기 누르면 프로필 수정으로 넘어가는 곳 >>> : ");
		
		List<Member> list = adminMemberService.AdminMemberSelect(member);
		logger.info("list.size() 찍어보기  >>> : " + list.size());
		logger.info("list.toString() 찍어보기 >>> " + list.toString());
		
		model.addAttribute("list",list);
		
		if(list.size() == 1) {
			model.addAttribute("list",list);
			logger.info("list.size()가 1일때 list.toString() >>> : " + list.toString());
			logger.info("list.size()가 1일때 list.size() 찍어보기 >>> : " + list.size());
			return "admin/AdminProfile";
		}else {
		
		return "admin/AdminProfile";
		}
	}
	*/
	
	@RequestMapping("AdminDelete")
	public String AdminDelete(Member member, Model model) {
		logger.info("AdminDelete 컨트롤러 함수 진입 >>> : ");
		int nCnt = adminMemberService.AdminMemberDelete(member);
		
		if(nCnt == 0) {
			logger.info("AdminMemberDelete의 Delete 값 nCnt >>> : " + nCnt);
			return "admin/Delete";
		}
		logger.info("딜리트구문 if문 끝나는곳 >>> ");
			return "admin/Delete";
		
	}
}
