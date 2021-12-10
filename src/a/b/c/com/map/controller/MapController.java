package a.b.c.com.map.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import a.b.c.com.common.ChabunUtil;
import a.b.c.com.common.CommonUtils;
import a.b.c.com.common.FileUploadUtil;
import a.b.c.com.common.service.ChabunService;
import a.b.c.com.map.service.MapService;
import a.b.c.com.map.vo.MapTradeVO;
import a.b.c.com.member.service.MemberService;
import a.b.c.com.member.vo.MemberVO;
import a.b.c.com.pet.service.PetService;
import a.b.c.com.pet.vo.PetVO;


@Controller
public class MapController {
	
	// Log Set
	private Logger logger = Logger.getLogger(MapController.class);
	private MapService mapService;
	private MemberService memberService;
	private ChabunService chabunService;
	private PetService petService;
	
	@Autowired(required=false)	
	public MapController (MapService mapService ,ChabunService chabunService, MemberService memberService, PetService petService) {
		this.mapService = mapService;
		this.chabunService = chabunService;
		this.memberService = memberService;
		this.petService = petService;
	}
	
	@RequestMapping("/withmap")
	public String withmap(Principal principal, Model model,MemberVO mvo) {
		logger.info("MapController ------ withmap() ");

		try {
			
			String mid = principal.getName();
			mvo.setMid(mid);
			List<MemberVO> memberList = memberService.memberSelect(mvo);
			MemberVO member = memberList.get(0);
			model.addAttribute("member", member);
			
			
		}catch (Exception e) {
			logger.info(e.getMessage());
			return "member/loginForm";
		}

		//logger.info("member 아이디 >>> : " + mid);
		return "map/withmap";
	}
	
	@RequestMapping("/selectmarker")
	public String selectmarker(MapTradeVO mvo,Principal principal, HttpServletRequest req, Model model) {
		logger.info("MapController.selectmarker() ");
		
		String tno = req.getParameter("tno");
		mvo = mapService.selectMarker(tno);
		model.addAttribute("mvo" ,mvo);
		
		
		try {
			String mid = principal.getName();
			model.addAttribute("loginid" ,mid);
		}catch (Exception e) {
			return "member/loginForm";
		}
		return "map/selectmarker";
	}
	
	@RequestMapping("/setmarkers")
	@ResponseBody
	public String setmarkers(MapTradeVO mvo) {
		List<MapTradeVO> listall = mapService.setMarkers(mvo);
		logger.info("MapController ------ setmarkers() " + listall.size());	
		//JSON SET
		JSONObject jObj = null;
		JSONArray jArr = new JSONArray();
		try {
			for(int i=0; listall.size() > i ;  i++) {
				jObj = new JSONObject();
				//  MapTrade DB Data Json
				MapTradeVO mvo_ = listall.get(i);
				jObj.put("tno", mvo_.getTno());
				jObj.put("content", mvo_.getTcontent());
				jObj.put("price", mvo_.getTprice());
				jObj.put("lat", mvo_.getTlat());
				jObj.put("lng", mvo_.getTlng());
				jObj.put("address", mvo_.getTaddress());
				jObj.put("writer", mvo_.getTwriter());
				jObj.put("photo", mvo_.getTphoto());
				jObj.put("mno", mvo_.getMno());
				jObj.put("pno", mvo_.getPno());
				jObj.put("propose", mvo_.getPropose());
				jObj.put("startdate", mvo_.getStartdate());
				jObj.put("enddate", mvo_.getEnddate());
				jObj.put("deleteyn", mvo_.getDeleteyn());
				jObj.put("insertdate", mvo_.getInsertdate());
				jObj.put("updatedate", mvo_.getUpdatedate());
				jArr.add(jObj);
				
			}
			// JOSN FILE IO SET
			String josnStr = jArr.toString();
			BufferedWriter bw = new BufferedWriter(
					new FileWriter(CommonUtils.JSON_FILE_PATH + "/" + "mapdata" + ".json"));
			bw.write(josnStr);
			bw.flush();
			bw.close(); //
			
			File f = new File(CommonUtils.JSON_FILE_PATH +"/" + "mapdata" + ".json");
			logger.info("MapData : " + josnStr);
		}
		catch(Exception e) {
			System.out.println("에러" + e.getMessage());
		}

		return "success";
	}
	
	@SuppressWarnings("unused")
	@RequestMapping(value="/mapTradeInsert", method=RequestMethod.POST)
	public String mapTradeInsert (HttpServletRequest req, Principal principal) {

		logger.info("MapController ------ mapTradeInsert() ");
		
		FileUploadUtil fu = new FileUploadUtil(  CommonUtils.MAPTRADE_IMG_UPLOAD_PATH
				   , CommonUtils.MAPTRADE_IMG_FILE_SIZE
				   , CommonUtils.MAPTRADE_EN_CODE);
		
		boolean bool = fu.imgfileUploadSize(req);
		boolean isfile = false;
		ArrayList<String> aFileName = fu.getFileNames();
		String tphoto = aFileName.get(0);
		
		String writer = principal.getName();

		MapTradeVO mvo = new MapTradeVO();
		// GET mno
		MemberVO memvo = new MemberVO();
		memvo.setMid(writer);
		List<MemberVO> member = memberService.memberSelect(memvo);
		memvo = member.get(0);
		

		String tno = ChabunUtil.getMapTradeChabun("a", chabunService.getMapChabun().getTno());
		String mno = memvo.getMno();
		System.out.println(tno);
		System.out.println("사진  : "+tphoto + bool );
		
		try {
			isfile = !tphoto.isEmpty();
		}catch(Exception e) {
			isfile = false;
		}
		
		System.out.println("파일이 존재 :: "+ isfile);
		
		mvo.setTno(tno);
		mvo.setTcontent(fu.getParameter("content"));
		mvo.setTprice(fu.getParameter("price"));
		mvo.setTlat(fu.getParameter("lat"));
		mvo.setTlng(fu.getParameter("lng"));
		mvo.setTaddress(fu.getParameter("addr"));
		mvo.setTwriter(writer);
		mvo.setMno(mno);
		mvo.setPno(fu.getParameter("pno"));
		String startDate = fu.getParameter("when_1").replace("T", " ");
		String endDate = fu.getParameter("when_2").replace("T", " ");
		mvo.setStartdate(startDate);
		mvo.setEnddate(endDate);
		mvo.setPropose("0");
		

		System.out.println(fu.getParameter("when_1"));
		System.out.println(fu.getParameter("when_2"));
		
		if(isfile) {
			mvo.setTphoto(tphoto);
		} else {
			mvo.setTphoto("default.jpg");
		}

		int nCnt = mapService.mapTradeInsert(mvo);
		
		
		return "map/withmap";
	}
	
	@RequestMapping(value="/mapTradeUpdate", method=RequestMethod.POST)
	public String mapTradeUpdate (HttpServletRequest req,Principal principal, MapTradeVO mvo) {
		logger.info("MapController.mapTradeUpdate() ");
		String propose = principal.getName();
		String tno = req.getParameter("tno");
		
		//mvo.setPROPOSE(propose);
		System.out.println(propose + tno );
		
		int nCnt = mapService.mapTradeUpdate(mvo);
		return "map/updateTrade";
	}
	
	@RequestMapping("/selectTrade")
	public String selectTrade(MapTradeVO mvo,Principal principal,Model model) {
		logger.info("MapController.selectTrade() ");
		String mid = principal.getName();
		//mvo.setTWRITER(mid);
		
		List<MapTradeVO> listall = mapService.selectTrade(mvo);
		model.addAttribute("listall", listall);
		model.addAttribute("loginid" ,mid);
		
		return "map/selectTrade";
	}
	
	@RequestMapping(value="/petlist_id",produces="application/text; charset=UTF-8")
	@ResponseBody
	public String petlistid (PetVO pvo, HttpServletRequest req) {
		String mno = req.getParameter("mno");
		
		
		System.out.println("mno :::::    "+mno);
		pvo.setMno(mno);
		List<PetVO> listAll = petService.petSelectAll(pvo);
		
		// JSON SET
		JSONObject jObj = null;
		JSONArray jArr = new JSONArray();

		try {
			
			for (int i = 0; listAll.size() > i; i++) {
				jObj = new JSONObject();

				PetVO pvo_ = listAll.get(i);
				jObj.put("pno", pvo_.getPno());
				jObj.put("pname", pvo_.getPname());
				jArr.add(jObj);
			}

			// JOSN FILE IO SET
			String josnStr = jArr.toString();
			System.out.println(josnStr);

		} catch (Exception e) {
			System.out.println("에러" + e.getMessage());
		}

		String josnStr = jArr.toString();

		return josnStr;
	}
	
	
	
}
