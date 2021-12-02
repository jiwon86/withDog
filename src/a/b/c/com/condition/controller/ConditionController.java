package a.b.c.com.condition.controller;

import org.apache.log4j.Logger;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import a.b.c.com.member.controller.MemberController;

@Controller
public class ConditionController {
	
	private Logger logger = Logger.getLogger(MemberController.class);
	
		@GetMapping("/takerequest")
		public String takerequest() {
			
			
			
			return "condition/takerequest";
		}
}
