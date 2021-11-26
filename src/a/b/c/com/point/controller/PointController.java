package a.b.c.com.point.controller;

import java.security.Principal;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import a.b.c.com.member.service.MemberService;
import a.b.c.com.member.vo.Member;


@Controller
public class PointController {
	
	private MemberService memberService;
	
	@Autowired(required=false)
	public PointController(MemberService memberService) {
		this.memberService = memberService;
	}

	Logger logger = Logger.getLogger(PointController.class);
	
	@GetMapping(value="point")
	public String point() {
	System.out.println("dddddd");
		return "point/pointmain";
	}
	
	// 포인트 페이지에서  프로필 눌렀을때 
	@GetMapping("pointprofile")
	public String PintProfile(Principal principal, Model model) {
		logger.info("포인트 프로필 넘기는곳 >>> : ");
		logger.info("MemberController.profile() 함수 진입");
		String mid = principal.getName();
		logger.info("member 아이디 >>> : " + mid);
		Member member = memberService.memberSelect(mid);
		
		logger.info("member.tostring() >>> : " + member.toString());
		model.addAttribute("member", member);

		return "point/profile";
	}
}
	