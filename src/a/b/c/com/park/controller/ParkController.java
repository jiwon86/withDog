package a.b.c.com.park.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import a.b.c.com.common.ChabunUtil;
import a.b.c.com.common.CommonUtils;
import a.b.c.com.common.FileUploadUtil;
import a.b.c.com.common.service.ChabunService;
import a.b.c.com.member.service.MemberService;
import a.b.c.com.member.vo.MemberVO;
import a.b.c.com.park.service.ParkService;
import a.b.c.com.park.service.ParkServiceImpl;
import a.b.c.com.park.vo.ParkVO;

@Controller
public class ParkController {
	private Logger logger = Logger.getLogger("ParkContorller.class");
	
	private ParkService parkService;
	private ChabunService ChabunService;
	private MemberService memberService;
	
	//생성자 오토와이어드
	@Autowired(required=false)
	public ParkController(ParkService parkService
						 ,ChabunService ChabunService, MemberService memberService) {
		this.parkService = parkService;
		this.ChabunService = ChabunService;
		this.memberService = memberService;
	}
	
	   @GetMapping("/parkForm")
	   public String parkForm(Model model, Principal principal) {
	      
		  String mid = principal.getName();
		  if (mid != null) {
		  
		      MemberVO memvo = new MemberVO();
		      memvo.setMid(principal.getName());
		      List<MemberVO> member = memberService.memberSelect(memvo);
		      memvo = member.get(0);
		      
		      logger.info("ParkController parkForm 함수 진입 >>> : ");
		      
		      logger.info("ParkController parkForm svo.getIid");
		      logger.info("ParkController parkForm svo.getIphoto");
		      logger.info("ParkController parkForm svo.getIupload");
		      logger.info("ParkController parkForm svo.getIcontent");
		      
		      List<ParkVO> listAll = parkService.parkSelectAll();
		      logger.info("ParkController parkSelectAll listAll.size() >>> : "+ listAll.size());
		      
		      model.addAttribute("listAll", listAll);
		      model.addAttribute("member", memvo);
		  }
	      return "park/parkForm";
	      
	   }


	@GetMapping("parkInsert") 
	public String parkInsertForm() {
		logger.info("ParkController parkInsertForm() 함수 진입 >>> :");
		
		return "park/parkInsertForm";
	}
	
	@PostMapping("parkInsert")
	public String parkInsert(HttpServletRequest req) {
		logger.info("ParkController parkInsert() 함수 진입 >>> :");
		
		// 채번 구하기
		String inum = ChabunUtil.getParkChabun("N", ChabunService.getParkChabun().getInum());
		logger.info("ParkController parkInsert inum >>> : " + inum);
				
		ParkVO _svo = null;
		_svo = new ParkVO();
		
		// 이미지 업로드 생성자로 가져오기
		FileUploadUtil fu = new FileUploadUtil( CommonUtils.PARK_IMG_UPLOAD_PATH
												,CommonUtils.PARK_IMG_FILE_SIZE
												,CommonUtils.PARK_EN_CODE);
		// 이미지 파일 원본 사이즈 
		// boolean bool = fu.imgfileUpload(req);
		// 이미지 파일 원본 사이즈 크기 조절 하기 
		boolean bool = fu.imgfileUploadSize(req);
		logger.info("BoardController boardInsert bool >>> : " + bool);
		logger.info("inum" + inum);
		logger.info("iid" + fu.getParameter("iid"));
		logger.info("iphoto" + fu.getParameter("iphoto"));
		logger.info("iupoad" + fu.getFileName("iupload"));
		logger.info("icontent" + fu.getParameter("icontent"));
		
		_svo.setInum(inum);
		_svo.setIid(fu.getParameter("iid"));
		_svo.setIphoto(fu.getParameter("iphoto"));
		_svo.setIupload(fu.getFileName("iupload"));
		_svo.setIcontent(fu.getParameter("icontent"));

		int nCnt = parkService.parkInsert(_svo);
		
		logger.info("ParkController parkInsert nCnt >>> : " + nCnt);
		
		if (nCnt > 0) { return "park/parkInsert";}

		return "park/parkForm";
	}
	
	//인스타그램 수정/삭제
	@RequestMapping(value="parkSelect", method=RequestMethod.GET)
	public String parkSelect(ParkVO svo, Model model) {
		logger.info("ParkController parkSelect 함수 진입() >>> :");
		
		logger.info("ParkController parkUpdate svo.getInum() >>> : " + svo.getInum());
		logger.info("ParkController parkUpdate svo.getIcontent() >>> : " + svo.getIcontent());
		
		List<ParkVO> list = parkService.parkSelect(svo);
		logger.info("ParkController parkUpdate nCnt >>> : " + list.toString());
		
		if (list.size() > 0) { 
			
			model.addAttribute("list", list);
			return "park/parkSelect";
		}
		return "park/parkForm";
	}
	
	
	 //글 수정하기 주석처리된부분
	 @RequestMapping(value="parkUpdate", method=RequestMethod.POST)
	 public String parkUpdate(ParkVO svo, Model model) {
		  logger.info("ParkController parkUpdate 함수 진입 >>> :");
		  
		  logger.info("ParkController parkUpdate svo.getInum() >>> : " +
		  svo.getInum());
		  logger.info("ParkController parkUpdate svo.getSbcontent() >>> : " +
		  svo.getIcontent()); int nCnt = parkService.parkUpdate(svo);
		  logger.info("SpringBoardController boardUpdate nCnt >>> : " + nCnt);
		  
		  if (nCnt > 0) { return "park/parkUpdate";}
		  
		  return "park/parkUpdate";
	}
	 
	 //글 삭제하기
	 @RequestMapping(value="parkDelete", method=RequestMethod.POST)
	 public String parkDelete(ParkVO svo, Model model) {
		logger.info("ParkController parkDelete 함수 진입 >>> :");
		
		logger.info("ParkController parkDelete svo.getInum() >>> : " + svo.getInum());		
		int nCnt = parkService.parkDelete(svo);
		logger.info("ParkController parkDelete nCnt >>> : " + nCnt);
		
		if (nCnt > 0) { return "park/parkDelete";}
		
		return "park/parkForm";
	}
	
}
