package a.b.c.com.member.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import a.b.c.com.common.CommonUtils;
import a.b.c.com.common.FileUploadUtil;
import a.b.c.com.member.service.MemberService;
import a.b.c.com.member.vo.Member;

@Controller
public class MemberController {
	
	private Logger logger = Logger.getLogger(MemberController.class);
	
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
	
	@RequestMapping("/admin")
	public String admin() {
		return "member/admin";
	}
	
	@RequestMapping("/head")
	public String head() {
		
		return "fragment/head";
	}
	
	@RequestMapping("/header")
	public String header() {
		return "fragment/header";		
	}
	
	@RequestMapping("/sidebar")
	public String sidebar() {
		return "fragment/sidebar";
	}
	
	@RequestMapping("/footer")
	public String footer() {
		return "fragment/footer";
	}
	
	@RequestMapping("/profile")
	public String profile(Principal principal, Model model) {
		logger.info("MemberController.profile() 함수 진입");
		String mid = principal.getName();
		logger.info("member 아이디 >>> : " + mid);
		
		Member member = memberService.memberSelect(mid);
		model.addAttribute("member", member);

		return "member/profile";
	}
	
	@PostMapping("/memberUpdate")
	@ResponseBody
	public String memberUpdate(HttpServletRequest req) {

		FileUploadUtil fu = new FileUploadUtil(  CommonUtils.MEMBER_IMG_UPLOAD_PATH
											   , CommonUtils.MEMBER_IMG_FILE_SIZE
											   , CommonUtils.MEMBER_EN_CODE);
		boolean bool = fu.imgfileUploadSize(req);
		logger.info("MemberController.memberUpdate() bool >>> : " + bool);
		String mroadaddress = 
				fu.getParameter("mroadaddress").concat("@").concat(fu.getParameter("mroadaddressdetail"));
		ArrayList<String> aFileName = fu.getFileNames();
		String mphoto = aFileName.get(0);
		
		Member mvo = null;
		mvo = new Member();
		
		mvo.setMno(fu.getParameter("mno"));
		mvo.setMname(fu.getParameter("mname"));
		mvo.setMemail(fu.getParameter("memail"));
		mvo.setMbirth(fu.getParameter("mbirth"));
		mvo.setMzonecode(fu.getParameter("mzonecode"));
		mvo.setMroadaddress(mroadaddress);
		mvo.setMjibunaddress(fu.getParameter("mjibunaddress"));
		
		if(mphoto != null) {
			mvo.setMphoto(mphoto);
		} else {
			mvo.setMphoto("default.jpg");
		}
		
		int nCnt = memberService.memberUpdate(mvo);
		
		if(nCnt > 0) {
			return "성공";
		}
		
		return "실패";
	}
	
}