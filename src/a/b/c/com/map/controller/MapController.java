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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import a.b.c.com.common.CommonUtils;
import a.b.c.com.common.FileUploadUtil;
import a.b.c.com.map.service.MapService;
import a.b.c.com.map.vo.MapTradeVO;


@Controller
public class MapController {
	
	// Log Set
	private Logger logger = Logger.getLogger(MapController.class);
	private MapService mapService;
	
	@Autowired(required=false)	
	public MapController (MapService mapService) {
		this.mapService = mapService;
	}
	
	@RequestMapping("/withmap")
	public String withmap(Principal principal) {
		logger.info("MapController ------ withmap() ");
		try {
			String mid = principal.getName();
		}catch (Exception e) {
			return "member/loginForm";
		}
		
		//logger.info("member 아이디 >>> : " + mid);
		return "map/withmap";
	}
	
	@RequestMapping("/setmarkers")
	public String setmarkers(MapTradeVO mvo) {
		
		List<MapTradeVO> listall = mapService.setMarkers(mvo);
		logger.info("MapController ------ setmarkers() " + listall.size());
		
		//JSON SET
		JSONObject jObj = null;
		JSONArray jArr = new JSONArray();
		
		try {
			for(int i=0; listall.size() > i ;  i++) {
				jObj = new JSONObject();
				
				MapTradeVO mvo_ = listall.get(i);
				jObj.put("tno", mvo_.getTNO());
				jObj.put("title", mvo_.getTTITLE());
				jObj.put("content", mvo_.getTCONTENT());
				jObj.put("writer", mvo_.getTWRITER());
				jObj.put("price", mvo_.getTPRICE());
				jObj.put("photo", mvo_.getTPHOTO());
				jObj.put("lat", mvo_.getTLAT());
				jObj.put("lng", mvo_.getTLNG());
				jObj.put("mno", mvo_.getMNO());
				jObj.put("deleteyn", mvo_.getDELETEYN());
				jObj.put("insertdate", mvo_.getINSERTDATE());
				jObj.put("updatedate", mvo_.getUPDATEDATE());
				
				System.out.println("lng" + mvo_.getTLNG());
				
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
			
			
			logger.info("a " + josnStr);
		}
		catch(Exception e) {
			System.out.println("에러" + e.getMessage());
		}
		
		
		return "map/withmap";
	}
	
	@SuppressWarnings("unused")
	@RequestMapping(value="/mapTradeInsert", method=RequestMethod.POST)
	public String mapTradeInsert (HttpServletRequest req, Principal principal) {
		logger.info("MapController ------ mapTradeInsert() ");
		
		FileUploadUtil fu = new FileUploadUtil(  CommonUtils.MAPTRADE_IMG_UPLOAD_PATH
				   , CommonUtils.MAPTRADE_IMG_FILE_SIZE
				   , CommonUtils.MAPTRADE_EN_CODE);
		
		boolean bool = fu.imgfileUploadSize(req);
		
		
		String writer = principal.getName();

		MapTradeVO mvo = new MapTradeVO();
		mvo.setTNO("4");
		mvo.setTTITLE(fu.getParameter("title"));
		mvo.setTCONTENT(fu.getParameter("content"));
		mvo.setTWRITER(writer);
		mvo.setTPRICE(fu.getParameter("price"));
		mvo.setTLAT(fu.getParameter("lat"));
		mvo.setTLNG(fu.getParameter("lng"));
		mvo.setMNO("2");
		String tphoto = fu.getParameter("photo");
		if(tphoto != null) {
			mvo.setTPHOTO(tphoto);
		} else {
			mvo.setTPHOTO("default.jpg");
		}

		int nCnt = mapService.mapTradeInsert(mvo);
		
		
		return "map/withmap";
	}
	
}
