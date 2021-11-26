package a.b.c.com.adminmember.controller;

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

@Controller
public class AdminMemberController {

	private AdminMemberService adminMemberService;
	
	@Autowired(required=false)
	public AdminMemberController(AdminMemberService adminMemberService) {
		this.adminMemberService = adminMemberService;
	}

	Logger logger = Logger.getLogger(AdminMemberController.class);

	@RequestMapping("AdminMemberSelectAll")
	public String memberSelect1(@ModelAttribute Member member, Model model) {
		logger.info("관리자페이지 Member 전체조회로 넘기기");
		
		List<Member> listAll = adminMemberService.AdminMemberSelectAll(member);
		
		logger.info("member.toString() >>> : " + member.toString());
		logger.info("listAll.size() >>> : " + listAll.size());
		logger.info("dsff" + listAll.toString());
		
		model.addAttribute("listAll",listAll);
		
		if(listAll.size() > 0) {
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
