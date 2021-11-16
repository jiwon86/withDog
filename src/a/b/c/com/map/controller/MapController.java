package a.b.c.com.map.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MapController {
	
	// Log Set
	private Logger logger = Logger.getLogger(MapController.class);
	
	@RequestMapping("/withmap")
	public String withmap() {
		return "map/withmap";
	}
	
}
