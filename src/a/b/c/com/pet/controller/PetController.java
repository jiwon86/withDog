package a.b.c.com.pet.controller;

import java.security.Principal;
import java.util.ArrayList;
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
import a.b.c.com.pet.service.PetService;
import a.b.c.com.pet.vo.PetVO;

@Controller
public class PetController {

   //로거
   Logger logger = Logger.getLogger(PetController.class);
   
   //서비스연결
   private PetService petService;
   private ChabunService chabunService;
   private MemberService memberService;
   
   //의존성 주입
   @Autowired(required=false)
   public PetController(PetService petService, ChabunService chabunService, MemberService memberService) {
      this.chabunService = chabunService;
      this.petService = petService;
      this.memberService = memberService;
   }
   
   //반려동물 프로필 진입---------------------------------------------------
   @GetMapping("myPetList")
   public String myPetList() {
      logger.info("PetController.myPetList 시작 >>>>>");
      return "pet/myPetList";
   }
   
   //반려동물 프로필 진입---------------------------------------------------
   @GetMapping("petInsertForm")
   public String petInsertForm(Principal principal, Model model, HttpServletRequest req,PetVO pvo, MemberVO mvo) {
      logger.info("PetController.petInsertForm 시작 >>>>>");
      
      String mno = null;
      
      // 세션을 통해 멤버번호를 가져오기
      if(principal != null) {
         String mid = principal.getName();
         MemberVO _mvo = null;
         _mvo = new MemberVO();
         
         _mvo.setMid(mid);
         
         List<MemberVO> memberList = memberService.memberSelect(_mvo);
         mno = memberList.get(0).getMno();
         MemberVO member = memberList.get(0);
         model.addAttribute("member", member);
      }
      
      //pvo.setMno(mvo.getMno());
      pvo.setMno(req.getParameter("mno"));
      logger.info("mno >>>>" + req.getParameter("mno"));
      
      return "pet/petInsertForm";
   }
   //전체조회----------------------------------------------------------------
   @RequestMapping(value="petSelectAll",method=RequestMethod.POST)
   public String petSelectAll(Principal principal, PetVO pvo, MemberVO mvo, Model model) {
      logger.info("PetController.petSelectAll 시작 >>>>>");
      
      String mno = null;
      
      // 세션을 통해 멤버번호를 가져오기
      if(principal != null) {
         String mid = principal.getName();
         MemberVO _mvo = null;
         _mvo = new MemberVO();
         
         _mvo.setMid(mid);
         
         List<MemberVO> memberList = memberService.memberSelect(_mvo);
         mno = memberList.get(0).getMno();
         MemberVO member = memberList.get(0);
         model.addAttribute("member", member);
      }
      
      logger.info("mvo.getMno() >>>> " + mvo.getMno());
      pvo.setMno(mno);
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
   public String petSelect(PetVO pvo, MemberVO member,Model model, HttpServletRequest req) {
      logger.info("PetController.petSelect 시작 >>>>>");
      
      pvo.setMno(req.getParameter("mno"));
      pvo.setPno(req.getParameter("pno"));
      logger.info("PetController petSelect member.getMno(mno) >>>> "+req.getParameter("mno"));
      logger.info("PetController petSelect pvo.getPno(pno) >>>> "+req.getParameter("pno"));
      logger.info("PetController petSelect req.getAttribute(pno) >>>> "+req.getAttribute("pno"));
      
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
   public String petInsert(HttpServletRequest req, MemberVO member, PetVO pvo, Model model,Principal principal) {
      logger.info("PetController.petInsert 시작 >>>>>");
      pvo.setMno(req.getParameter("mno"));
      
      //채번 구하기
      String pno = ChabunUtil.getPetChabun("D", chabunService.getPetChabun().getPno());
      logger.info("PetController.petInsert pno 채번 : " + pno);
      
      //이미지 업로드
      FileUploadUtil fu = new FileUploadUtil( CommonUtils.PET_IMG_UPLOAD_PATH
                                    ,CommonUtils.PET_IMG_FILE_SIZE
                                    ,CommonUtils.PET_EN_CODE);
      
      boolean bool = fu.imgfileUploadSize(req);
      logger.info("PetController.petInsert bool >>>>>"+ bool);
      
      //반려동물번호
      pvo.setPno(pno);
      //반려동물이름
      pvo.setPname(fu.getParameter("pname"));
      //반려동물종
      pvo.setPtype(fu.getParameter("ptype"));
      //반려동물성별
      pvo.setPgender(fu.getParameter("pgender"));
      //반려동물중성화여부
      pvo.setPneutral(fu.getParameter("pneutral"));
      //반려동물사진
      ArrayList<String> aFileName = fu.getFileNames();
      String pphoto = aFileName.get(0);
      pvo.setPphoto(pphoto);
      //반려동물몸무게
      pvo.setPweight(fu.getParameter("pweight"));
      //반려동물병원
      pvo.setPhospital(fu.getParameter("phospital"));
      //반려동물특이사항
      pvo.setPmemo(fu.getParameter("pmemo"));
      //반려동물나이
      pvo.setPages(fu.getParameter("pages"));
      //회원번호
      pvo.setMno(fu.getParameter("mno"));
      member.setMno(fu.getParameter("mno"));
      
      logger.info("mno >>>>>" + fu.getParameter("mno"));
      String mno = fu.getParameter("mno");
      String mid = principal.getName();
      member.setMid(mid);
      List<MemberVO> memberList = memberService.memberSelect(member);
      member = memberList.get(0);
      
      int nCnt = petService.petInsert(pvo);
      
      if(nCnt>0) {
         logger.info("nCnt >>>>> "+nCnt);
         model.addAttribute("mno", mno);
         model.addAttribute("member", member);
         return "pet/petInsert";
      }
      
      return "pet/myPetList";
   }
   
   //수정하기---------------------------------------------------------------
   @PostMapping("petUpdate")
   public String petUpdate(HttpServletRequest req, MemberVO member, PetVO pvo, Model model,Principal principal) {
      logger.info("PetController.petUpdate 시작 >>>> ");
      
      //회원정보 받아옴
      pvo.setMno(req.getParameter("mno"));
      pvo.setPno(req.getParameter("pno"));
      logger.info("PetController petUpdate member.getMno() >>>> "+req.getParameter("mno"));
      logger.info("PetController petUpdate pvo.getPno() >>>> "+req.getParameter("pno"));
      
      //수정된 정보 받아옴
      //이미지 업로드
      FileUploadUtil fu = new FileUploadUtil( CommonUtils.PET_IMG_UPLOAD_PATH
                                    ,CommonUtils.PET_IMG_FILE_SIZE
                                    ,CommonUtils.PET_EN_CODE);
      
      boolean bool = fu.imgfileUploadSize(req);
      logger.info("PetController.petUpdate bool >>>>>"+ bool);
      
      //반려동물이름
      pvo.setPname(fu.getParameter("pname"));
      //반려동물종
      pvo.setPtype(fu.getParameter("ptype"));
      //반려동물성별
      pvo.setPgender(fu.getParameter("pgender"));
      //반려동물중성화여부 
      pvo.setPneutral(fu.getParameter("pneutral"));
      //반려동물사진
      ArrayList<String> aFileName = fu.getFileNames();
      String pphoto = aFileName.get(0);
      pvo.setPphoto(pphoto);
      
      //반려동물몸무게
      pvo.setPweight(fu.getParameter("pweight"));
      //반려동물병원
      pvo.setPhospital(fu.getParameter("phospital"));
      //반려동물특이사항
      pvo.setPmemo(fu.getParameter("pmemo"));
      //반려동물나이
      pvo.setPages(fu.getParameter("pages"));
      //회원번호
      pvo.setMno(fu.getParameter("mno"));
      //반려견 번호
      pvo.setPno(fu.getParameter("pno"));
      
      //회원번호
      pvo.setMno(fu.getParameter("mno"));
      member.setMno(fu.getParameter("mno"));
      
      logger.info("mno >>>>>" + fu.getParameter("mno"));
      String mno = fu.getParameter("mno");
      String mid = principal.getName();
      
      member.setMid(mid);
      List<MemberVO> memberList = memberService.memberSelect(member);
      member = memberList.get(0);
      
      
      //적용될 반려동물 번호 확인
      logger.info("PetController.petUpdate pvo.getPno() >>>>"+pvo.getPno());
      
      int nCnt = petService.petUpdate(pvo);
      logger.info("PetController.petUpdate nCnt>>>>" + nCnt);
      
      
      if(nCnt > 0) {
         model.addAttribute("member", member);
         model.addAttribute("mno", mno);
         return "pet/petUpdate";
      }
      return "pet/myPetList";
   }
   
   //삭제하기----------------------------------------------------------------
   @PostMapping("petDelete")
   public String petDelete(PetVO pvo, MemberVO member,Model model, HttpServletRequest req,Principal principal) {
      logger.info("PetController.petDelete 시작 >>>>>");
      
      //회원정보 받아옴
      pvo.setMno(req.getParameter("mno"));
      pvo.setPno(req.getParameter("pno"));
      logger.info("PetController petUpdate member.getMno() >>>> "+req.getParameter("mno"));
      logger.info("PetController petUpdate pvo.getPno() >>>> "+req.getParameter("pno"));
      
      //수정된 정보 받아옴
      //이미지 업로드
      FileUploadUtil fu = new FileUploadUtil( CommonUtils.PET_IMG_UPLOAD_PATH
                                    ,CommonUtils.PET_IMG_FILE_SIZE
                                    ,CommonUtils.PET_EN_CODE);
      
      boolean bool = fu.imgfileUploadSize(req);
      logger.info("PetController.petUpdate bool >>>>>"+ bool);
      
      
      
      
      //회원번호
      pvo.setMno(fu.getParameter("mno"));
      //반려견 번호
      pvo.setPno(fu.getParameter("pno"));
      
      //회원번호
      pvo.setMno(fu.getParameter("mno"));
      member.setMno(fu.getParameter("mno"));
      String mid = principal.getName();
      
      member.setMid(mid);
      List<MemberVO> memberList = memberService.memberSelect(member);
      member = memberList.get(0);
      
      logger.info("mno >>>>>" + fu.getParameter("mno"));
      
      //적용될 반려동물 번호 확인
      logger.info("PetController.petUpdate pvo.getPno() >>>>"+pvo.getPno());
      
      int nCnt = petService.petDelete(pvo);
      logger.info("PetController.petDelete nCnt>>>>" + nCnt);
      
      if(nCnt > 0) {
    	  model.addAttribute("member", member);
         return "pet/petDelete";
      }
      return "pet/myPetList";
      
   }
   
   @GetMapping("/dash.wd")
   public String dash() {
	   
	   return "pet/dash";
   }
}

