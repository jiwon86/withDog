package a.b.c.com.notice.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import a.b.c.com.common.service.ChabunService;
import a.b.c.com.notice.service.NoticeService;

@Controller
public class NoticeController {
	Logger logger = Logger.getLogger(NoticeController.class);	
	
	@RequestMapping("noticeSelectAll")
	public String selectall() {
		return "notice/noticeSelectAll";
	}
	@RequestMapping("noticeSelect")
	public String noticeSelect() {
		return "notice/noticeSelect";
	}
	@RequestMapping("noticeInsert")
	public String noticeInsert() {
		return "notice/noticeInsert";
	}
	@RequestMapping("noticeUpdate")
	public String noticeUpdate() {
		return "notice/noticeUpdata";
	}
	
	
}
