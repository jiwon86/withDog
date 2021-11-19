package a.b.c.com.member.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import a.b.c.com.common.ChabunUtil;
import a.b.c.com.common.CommonUtils;
import a.b.c.com.common.FileUploadUtil;
import a.b.c.com.common.service.ChabunService;
import a.b.c.com.member.service.MemberService;
import a.b.c.com.member.vo.Member;
import a.b.c.com.member.vo.MemberAuth;

@Controller
public class MemberController {
	
	private Logger logger = Logger.getLogger(MemberController.class);
	
	private MemberService memberService;
	private ChabunService chabunService;
	
	@Autowired(required=false)
	public MemberController(MemberService memberService, ChabunService chabunService) {
		this.memberService = memberService;
		this.chabunService = chabunService;
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
	
	// 관리자페이지에서 상세보기로 넘기는곳
	@RequestMapping("/profile2")
	public String profile(HttpServletRequest req, Model model) {
		logger.info("MemberController.profile() 함수 진입");
		String mid = req.getParameter("mid");
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

	//----------------------------------------------------------------태준-------------------------------------------------------------------//
	
	// 회원가입 폼으로 이동
		@RequestMapping("register")
		public String register() {
			logger.info("회원가입 폼으로 넘기는 곳 >>> :");
			return "member/register";
		}
//		@RequestMapping(value="login1")
//		public String login1(@ModelAttribute Member member, Model model) {
//			logger.info("MemberInsert 함수 진입 >>> ");
//			logger.info("member.tostring() >>> : " + member.toString());
//			
//			String mno = ChabunUtil.getMemChabun("D", chabunService.getMemChabun().getMno());
//			logger.info("mno ::: "+mno);
//			member.setMno(mno);
//			logger.info("");
//				
//			
//			return "member/loginForm";
//		}
	// 회원가입 완료 후 로그인 화면으로 이동
		@RequestMapping(value="login1" ,method=RequestMethod.POST)
		public String login1(HttpServletRequest req) {
			logger.info("MemberInsert 함수 진입 >>>> ");
			
			// 채번 구하기
			String mno = ChabunUtil.getMemChabun("D",chabunService.getMemChabun().getMno());
			logger.info("MemberController memInsert() 함수 진입");
			
			FileUploadUtil fu = new FileUploadUtil( CommonUtils.MEMBER_IMG_UPLOAD_PATH
												   ,CommonUtils.MEMBER_IMG_FILE_SIZE
												   ,CommonUtils.MEMBER_EN_CODE);
			
			boolean bool = fu.imgfileUploadSize(req);
			
			logger.info("여기>>>>>>>>>>>>>>>>>>>>>>.");
			
			System.out.println("mno >>> : " + mno);
			System.out.println("mid >>> : " + fu.getParameter("mid"));
			System.out.println("mpw >>> : " + fu.getParameter("mpw"));
			System.out.println("memail >>> : " + fu.getParameter("memail"));
			System.out.println("mname >>> : " + fu.getParameter("mname"));
			System.out.println("mbirth >>> : " + fu.getParameter("mbirth"));
			System.out.println("mzonecode >>> : " + fu.getParameter("mzonecode"));
			//System.out.println("mroadaddress >>> : " + mroadaddress);
			System.out.println("mjibunaddress >>> : " + fu.getParameter("mjibunaddress"));
			
			ArrayList<String> aFileName = fu.getFileNames();
			String mphoto = aFileName.get(0);
			
			String mroadaddress = fu.getParameter("mroadaddress");
			String detailroad = fu.getParameter("detailroad");
			mroadaddress = mroadaddress.concat("-").concat(detailroad);
			
			Member member = null;
			member = new Member();
			
			// 넘버
			member.setMno(mno);
			// 아이디
			member.setMid(fu.getParameter("mid"));
			// 비번
			member.setMpw(fu.getParameter("mpw"));
			// 이메일
			member.setMemail(fu.getParameter("memail"));
			// 이름
			member.setMname(fu.getParameter("mname"));
			// 생일
			member.setMbirth(fu.getParameter("mbirth"));
			//포토
			member.setMphoto(mphoto);
			
			// 우편번호 
			member.setMzonecode(fu.getParameter("mzonecode"));
			// 도로명주소 + 상세주소 = mroadaddress

			member.setMroadaddress(mroadaddress);
			
		 	//지번주소
			member.setMjibunaddress(fu.getParameter("mjibunaddress"));
			logger.info("다음 >>>>>>>>>>>>>>>>>>>>>>>>..");
			
			int nCnt = memberService.memberInsert(member);
			
			if(nCnt > 0 ) {
				MemberAuth memberAuth = new MemberAuth();
				
				memberAuth.setMno(mno);
				
				int result = memberService.memberAuthInsert(memberAuth);
				
				return "member/loginForm";
			} else {
				return "member/register";
			}
		}
		// 회원 아이디 체크 하는 방법
		@RequestMapping("memIdCheck")
		@ResponseBody
		public Object memIdCheck(Member member) {
			logger.info("회원 아이디 중복 확인 컨트롤러 >>>> ");
			logger.info("id check .getid() >>> : " + member.getMid());
			
			List<Member> list = memberService.memberIdCheck(member);
			logger.info("list.size() >>> : " + list.size());
			
			String msg="";
			if(list.size() == 0) {
				msg = "ID_YES";
				
			}else {
				msg = "ID_NO";
			}
			return msg;
			
		}
	
}