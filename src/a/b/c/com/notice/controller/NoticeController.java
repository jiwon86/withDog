package a.b.c.com.notice.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import a.b.c.com.notice.service.NoticeService;
import a.b.c.com.notice.vo.NoticeVO;



@Controller
public class NoticeController {
	Logger logger = Logger.getLogger(NoticeController.class);	
	/*
	private NoticeService noticeService;
	
	// 생성자  Autowired
	@Autowired(required=false)
	public NoticeController(NoticeService, noticeService
							,ChabunService chabunService) {
		this.noticeService = noticeService;
		this.chabunService = chabunService;
	}
	
	// 공지사항 글 입력 폼
	@RequestMapping(value="noticeInsert", method=RequestMethod.GET)
	public String noticeForm() {
		return "notice/notictInsert";
	}
	
	@RequestMapping(value="noticeSelectAll", method=RequestMethod.GET)
	public String noticeSelectall(NoticeVO nvo, Model model) {
		
		List<NoticeVO> listAll = noticeService.noticeSelectAll(nvo);
		
		if(listAll.size() > 0) {
			model.addAttribute("listAll", listAll);
			return "notice/noticeSelectAll";
		}
		return "notice/noticeInsert";
	}
*/
	@RequestMapping("noticeSelectAll")
	public String noticeSelectAll() {
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
		return "notice/noticeUpdate";
	}
	@RequestMapping("noticeDelete")
	public String noticeDelete() {
		return "notice/noticeDelete";
	}
	
	
}
