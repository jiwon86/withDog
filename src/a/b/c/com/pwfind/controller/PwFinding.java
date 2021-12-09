package a.b.c.com.pwfind.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import a.b.c.com.member.vo.Member;
import a.b.c.com.pwfind.service.PwfindService;

@Controller
public class PwFinding {
	
	Logger logger = Logger.getLogger(PwFinding.class);
	
	private JavaMailSender mailSender;
	private PwfindService pwfindService;
	
	
	@Autowired(required=false)
	public PwFinding(PwfindService pwfindService, JavaMailSender mailSender) {
		this.pwfindService = pwfindService;
		this.mailSender = mailSender;
	}
	
	// 비밀번호 찾기 페이지로 이동하기
	@RequestMapping("PwFinding")
	public String pwFinding() {
		return "pwfind/pwcheck";
	}
	

	@RequestMapping("pw_auth")
	public ModelAndView pw_auth(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model)throws IOException{
		
		
		
		String mname = request.getParameter("mname");
		String memail = request.getParameter("memail");
		String num1 = request.getParameter("num");
		
		if (num1 != null &&!num1.equals("")) {
			ModelAndView mv = new ModelAndView();
			mv.addObject("num", num1);
			mv.addObject("memail", memail);
			mv.setViewName("pwfind/pw_auth");
			
			return mv;
		}
			
		logger.info("되돌아온 num의 값 >>> : " + num1);
		logger.info("mname >>> : " + mname);
		logger.info("memail >>> : " + memail);
		
		Member member = pwfindService.pwfinding(memail);
		
		logger.info("채번 넘기고 나서 확인하는 곳 >>> : ");
		
		if(member != null) {
			Random r = new Random();
			int num = r.nextInt(999999);
			
			if(member.getMname().equals(mname)) {
				session.setAttribute("memail", member.getMemail());
				
				String setfrom = "hsm44444@naver.com";
				String tomail = memail;
				String title = "비밀번호 변경 인증 이메일 입니다.";
				String content = System.getProperty("line.separator")+"안녕하세요 회원님" + System.getProperty("line.separator")
				+"비밀번호 찾기 인증번호는" + System.getProperty("line.separator") + num + "입니다" + System.getProperty("line.separator");
				
				try {
					MimeMessage message = mailSender.createMimeMessage();
					MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");

					messageHelper.setFrom(setfrom); 
					messageHelper.setTo(tomail); 
					messageHelper.setSubject(title);
					messageHelper.setText(content); 

					mailSender.send(message);
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}

				ModelAndView mv = new ModelAndView();
				mv.setViewName("pwfind/pw_auth");
				mv.addObject("num", num);
				mv.addObject("memail", memail);
				logger.info("memail >>> : " + memail);
				return mv;
			}else {
				ModelAndView mv = new ModelAndView();
				mv.setViewName("pwfind/pwcheck");
				return mv;
			}
			}else {
				ModelAndView mv = new ModelAndView();
				mv.setViewName("pwfind/pwcheck");
				return mv;
			}
		
	}
	@PostMapping("pw_set")
	public String pw_set(@RequestParam(value="email_injeung") String email_injeung,
				@RequestParam(value="num") String num, Model model, 
				@RequestParam(value="memail") String memail) throws IOException{
			logger.info("email_injeung 값 >>>>>>> : " + email_injeung);
			logger.info("String num 의 값 >>> : " + num); // 인증번호
			logger.info("memail의 값 >>>>> >>> : " + memail);
			if(email_injeung.equals(num)) {
				model.addAttribute("memail", memail);
				logger.info("Last pwupdate memail >>> : " + memail);
				return "pwfind/pw_new";
			}
			else {
				model.addAttribute("num", num);
				model.addAttribute("memail", memail);
				System.out.println(">> d실패하면 여기 >>> ㅣ");
				logger.info("num 의 값 >>> : " +  num);
				return "pwfind/fail";
			}
	} //이메일 인증번호 확인
	
	@RequestMapping("pwupdate")
	public String pwupdate(Member member, HttpSession session, 
			@RequestParam(value="memail") String memail) throws IOException {
		
		logger.info("ddddd >>>> : " + member.getMpw());
		logger.info("dddfdfdfdf >>>> : " + member.getMemail());
		logger.info("pwupdate의 memail 값 확인 >>> : " + memail);
		int result =  pwfindService.pwupdate(member);
		logger.info("비번 바꾸고 성공한 후 >>> : ");
		if(result == 1) {
			return "pwfind/success";
		}else {
			return null;
		}
		
		
	}
}
	
	
	
