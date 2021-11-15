package a.b.c.com.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import a.b.c.com.member.service.MemberService;

@Controller
public class MemberController {
	
	private MemberService memberService;
	
	@Autowired(required=false)
	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	// 권한제한에 접근할 때
	@RequestMapping("/accessError")
	public String accessDenied(Authentication auth, Model model) {
		
		model.addAttribute("msg", "Access Denied");
		
		return "member/accessError";
	}
	
	//로그인폼 이동
	@RequestMapping("/login")
	public String loginForm(String error, String logout, Model model) {
		if(error != null) {
			model.addAttribute("error", "Login Error");
		}
		if(logout != null) {
			model.addAttribute("logout", "Logout");
		}
		
		return "member/loginForm";
	}
	
}
