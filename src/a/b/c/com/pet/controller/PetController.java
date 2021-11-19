package a.b.c.com.pet.controller;

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
import a.b.c.com.pet.service.PetService;
import a.b.c.com.pet.vo.PetVO;

@Controller
public class PetController {

	//로거
	Logger logger = Logger.getLogger(PetController.class);
	
	//서비스연결
	private PetService petService;
	private ChabunService chabunService;
	
	//의존성 주입
	@Autowired(required=false)
	public PetController(PetService petService, ChabunService chabunService) {
		this.chabunService = chabunService;
		this.petService = petService;
	}
	
	//반려동물 프로필 진입---------------------------------------------------
	@GetMapping("myPetList")
	public String myPetList() {
		logger.info("PetController.myPetList 시작 >>>>>");
		return "pet/myPetList";
	}
	
	//반려동물 프로필 진입---------------------------------------------------
		@GetMapping("petInsertForm")
		public String petInsertForm() {
			logger.info("PetController.petInsertForm 시작 >>>>>");
			return "pet/petInsertForm";
		}
	//전체조회----------------------------------------------------------------
	@RequestMapping(value="petSelectAll",method=RequestMethod.GET)
	public String petSelectAll(PetVO pvo, Model model) {
		logger.info("PetController.petSelectAll 시작 >>>>>");
		
		//서비스 연결
		List<PetVO> listAll = petService.petSelectAll(pvo);
		logger.info("PetController.petSelectAll listAll.size() >>>>>" + listAll.size());
		logger.info("listAll 에 담긴 값"+listAll);
		//nullpoint check : size = 0이면 조회 안 된 것임
		if(listAll.size()>0) {
			model.addAttribute("listAll", listAll);
			//조회가 잘 되었다면 listAll에 담긴 값을 SelectAll로 보냄
			return "pet/petSelectAll";
		}
		
		return "pet/petInsertForm";
	}
	//선택조회----------------------------------------------------------------
	@GetMapping("petSelect")
	public String petSelect(PetVO pvo, Model model) {
		logger.info("PetController.petSelect 시작 >>>>>");
		logger.info("PetController.petSelect >>>>> pvo.getPno"+pvo.getPno());
		
		List<PetVO> listS = petService.petSelect(pvo);
		logger.info("PetController.petSelect listS.size() >>>>>"+listS.size());
		
		//nullpoint Check
		if(listS.size()==1) {
			model.addAttribute("listS", listS);
			return "pet/petSelect";
		}
		
		return "pet/myPetList";
	}
	//추가하기----------------------------------------------------------------
	@PostMapping("petInsert")
	public String petInsert(HttpServletRequest req) {
		logger.info("PetController.petInsert 시작 >>>>>");
		
		//채번 구하기

		//String pno = ChabunUtil.getBoardChabun("P", chabunService.getPetChabun().getPno());
		String pno = "P202111170002";
		
		//String pno = ChabunUtil.getBoardChabun("P", chabunService.getPetChabun().getPnum());
		
		//이미지 업로드
		FileUploadUtil fu = new FileUploadUtil( CommonUtils.MEMBER_IMG_UPLOAD_PATH
											   ,CommonUtils.MEMBER_IMG_FILE_SIZE
											   ,CommonUtils.MEMBER_EN_CODE);
		
		boolean bool = fu.imgfileUploadSize(req);
		logger.info("PetController.petInsert bool >>>>>"+ bool);
		
		PetVO pvo = null;
		pvo = new PetVO();
		pvo.petVOlog(pvo);
		
		//반려동물번호
		pvo.setPno(pno);
		//반려동물이름
		//pvo.setPname(req.getParameter("pname"));
		pvo.setPname(fu.getParameter("pname"));
		//반려동물종
		//pvo.setPtype(req.getParameter("ptype"));
		pvo.setPtype(fu.getParameter("ptype"));
		//반려동물성별
		//pvo.setPgender(req.getParameter("pgender"));
		pvo.setPgender(fu.getParameter("pgender"));
		//반려동물중성화여부
		//pvo.setPneutral(req.getParameter("pneutral"));
		pvo.setPneutral(fu.getParameter("pneutral"));
		//반려동물사진
		//pvo.setPphoto(req.getParameter("pphoto"));
		pvo.setPphoto(fu.getParameter("pphoto"));
		//반려동물몸무게
		//pvo.setPweight(req.getParameter("pweight"));
		pvo.setPweight(fu.getParameter("pweight"));
		//반려동물병원
		//pvo.setPhospital(req.getParameter("phospital"));
		pvo.setPhospital(fu.getParameter("phospital"));
		//반려동물특이사항
		//pvo.setPmemo(req.getParameter("pmemo"));
		pvo.setPmemo(fu.getParameter("pmemo"));
		//반려동물나이
		//pvo.setPages(req.getParameter("pages"));
		pvo.setPages(fu.getParameter("pages"));
		//회원번호
		//pvo.setMno(req.getParameter("mno"));
		pvo.setMno(fu.getParameter("mno"));
		
		int nCnt = petService.petInsert(pvo);
		
		if(nCnt>0) {
			return "pet/petInsert";
		}
		
		return "pet/myPetList";
	}
	
	//수정하기---------------------------------------------------------------
	@PostMapping("petUpdate")
	public String petUpdate(HttpServletRequest req, PetVO pvo, Model model) {
		logger.info("PetController.petUpdate 시작 >>>> ");
		
		//수정된 정보 받아옴
		
		//반려동물이름
		pvo.setPname(req.getParameter("pname"));
		//반려동물종
		pvo.setPtype(req.getParameter("ptype"));
		//반려동물성별
		pvo.setPgender(req.getParameter("pgender"));
		//반려동물중성화여부
		pvo.setPneutral(req.getParameter("pneutral"));
		//반려동물사진
		pvo.setPphoto(req.getParameter("pphoto"));
		//반려동물몸무게
		pvo.setPweight(req.getParameter("pweight"));
		//반려동물병원
		pvo.setPhospital(req.getParameter("phospital"));
		//반려동물특이사항
		pvo.setPmemo(req.getParameter("pmemo"));
		//반려동물나이
		pvo.setPages(req.getParameter("pages"));
		
		//적용될 반려동물 번호 확인
		logger.info("PetController.petUpdate pvo.getPno() >>>>"+pvo.getPno());
		
		int nCnt = petService.petUpdate(pvo);
		logger.info("PetController.petUpdate nCnt>>>>" + nCnt);
		
		if(nCnt > 0) {
			return "pet/petUpdate";
		}
		return "pet/myPetList";
	}
	
	//삭제하기----------------------------------------------------------------
	@PostMapping("petDelete")
	public String petDelete(PetVO pvo, Model model) {
		logger.info("PetController.petDelete 시작 >>>>>");
		
		logger.info("PetController.petDelete pvo.mno >>>>>");
		int nCnt = petService.petDelete(pvo);
		logger.info("PetController.petDelete nCnt>>>>" + nCnt);
		
		if(nCnt > 0) {
			return "pet/petDelete";
		}
		return "pet/myPetList";
	}
}
