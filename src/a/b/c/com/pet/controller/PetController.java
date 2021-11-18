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
	//전체조회----------------------------------------------------------------
	@RequestMapping(value="petSelectAll",method=RequestMethod.GET)
	public String petSelectAll(PetVO pvo, Model model) {
		logger.info("PetController.petSelectAll 시작 >>>>>");
		
		//서비스 연결
		List<PetVO> listAll = petService.petSelectAll(pvo);
		logger.info("PetController.petSelectAll listAll.size() >>>>>" + listAll.size());
		
		//nullpoint check : size = 0이면 조회 안 된 것임
		if(listAll.size()>0) {
			//조회가 잘 되었다면 listAll에 담긴 값을 SelectAll로 보냄
			return "pet/petSelectAll";
		}
		
		return "pet/myPetList";
	}
	//선택조회----------------------------------------------------------------
	
	//추가하기----------------------------------------------------------------
	@PostMapping("petInsert")
	public String petInsert(HttpServletRequest req) {
		logger.info("PetController.petInsert 시작 >>>>>");
		
		//채번 구하기
		//String pno = "P202111170002";
		
		//String pno = ChabunUtil.getBoardChabun("P", chabunService.getPetChabun().getPnum());
		
		//이미지 업로드
		FileUploadUtil fu = new FileUploadUtil(CommonUtils.MEMBER_IMG_UPLOAD_PATH, CommonUtils.MEMBER_IMG_FILE_SIZE, CommonUtils.NOTICE_EN_CODE);
		boolean bool = fu.imgfileUpload(req);
		logger.info("PetController.petInsert bool >>>>>"+ bool);
		
		PetVO pvo =null;
		pvo = new PetVO();
		
		
		int nCnt = petService.petInsert(pvo);
		
		if(nCnt>0) {
			return "pet/petInsert";
		}
		
		return "pet/myPetList";
	}
	
	//삭제하기----------------------------------------------------------------
}
