package a.b.c.com.common;

public abstract class ChabunUtil {
	
	public static final String BIZ_GUBUN_Q = "Q"; //Q&A
	public static final String BIZ_GUBUN_RQ = "RQ"; //R : Q&A
	public static final String BIZ_GUBUN_M = "M"; // 회원
	public static final String BIZ_GUBUN_B = "B"; // 게시판
	public static final String BIZ_GUBUN_RB = "RB"; // 게시판 댓글
	public static final String BIZ_GUBUN_N = "NB"; // 공지사항

	public static final String BIZ_GUBUN_R = "R"; // 후기게시판 R 후기번호


	public static final String BIZ_GUBUN_A = "A"; // 반려동물 관련 매칭

	public static final String BIZ_GUBUN_PE = "P"; //반려동물
	public static final String BIZ_GUBUN_P = "P"; // 산책스타그램
	public static final String BIZ_GUBUN_PAY = "PAY"; // 결제
	public static final String BIZ_GUBUN_C = "C"; // 조건제시
	public static final String BIZ_GUBUN_RP = "RP"; // 산책스타그램 댓글
	
	// type : D(20210001), M(YYYYMM), Y(YYYY)
	public static String numpad(String t, String c) {
		
		for(int i=c.length(); i<4; i++) {
			c = "0" + c;
		}
		
		String ymd = DateFormatUtil.ymdFormats(t);
		
		return ymd.concat(c);
	}
	
	public static String numpad2(String c) {
		for(int i=c.length(); i<4; i++) {
			c = "0" + c;
		}
		
		
		return c;
	}
	
	/*
	 * //Q&A Chabun public static String qnanumpad(String q, String n) { for(int
	 * i=n.length(); i<3; i++) { n = "0" + n; }
	 * 
	 * return n; }
	 */
	
	//Q&A
	public static String getQnaChabun(String type, String memNum) {
		return BIZ_GUBUN_Q.concat(ChabunUtil.numpad(type, memNum));
		
	}	
	
	//R : Q&A
	public static String getRqnaChabun(String type, String memNum) {
		return BIZ_GUBUN_RQ.concat(ChabunUtil.numpad(type, memNum));
	}
	
	// 회원 번호
	public static String getMemChabun(String type, String memNum) {
		return BIZ_GUBUN_M.concat(ChabunUtil.numpad(type, memNum));
	}
	
	// 게시판 글 번호
	public static String getBoardChabun(String type, String memNum) {
		return BIZ_GUBUN_B.concat(ChabunUtil.numpad(type, memNum));
	}
	
	// 게시판 댓글 글 번호
	public static String getRboardChabun(String type, String memNum) {
		return BIZ_GUBUN_RB.concat(ChabunUtil.numpad(type, memNum));
	}
	
	// 공지사항 번호
	public static String getNoticeChabun(String type, String memNum) {
		return BIZ_GUBUN_N.concat(ChabunUtil.numpad(type, memNum));
	}
	

	// 후기게시판 후기번호
	public static String getReviewCrnumChabun(String type, String memNum) {
		return BIZ_GUBUN_R.concat(ChabunUtil.numpad(type, memNum));
	}

	 


	// 반려동물 위탁 매칭 번호
	public static String getAgencyChabun(String type, String agencyNum) {
		return BIZ_GUBUN_A.concat(ChabunUtil.numpad(type, agencyNum));
	}
	

	//반려동물 번호
	public static String getPetChabun(String type, String memNum) {
		return BIZ_GUBUN_PE.concat(ChabunUtil.numpad(type, memNum));
	}

	// 산책스타그램 번호
	public static String getParkChabun(String type, String memNum) {
		return BIZ_GUBUN_P.concat(ChabunUtil.numpad(type, memNum));
	}
	
	// 산책스타그램 댓글 번호
	public static String getRparkChabun(String type, String memNum) {
		return BIZ_GUBUN_RP.concat(ChabunUtil.numpad(type, memNum));
	}


	// 맵 트레이드 번호
	public static String getMapTradeChabun(String type, String memNum) {
		return ChabunUtil.numpad2(memNum);
	}

	// 결제 번호
	public static String getPayChabun(String type, String payNum) {
		return BIZ_GUBUN_PAY.concat(ChabunUtil.numpad(type, payNum));
	}
	
	// 조건제시 번호
	public static String getConditionChabun(String type, String cNum) {
		return BIZ_GUBUN_C.concat(ChabunUtil.numpad(type, cNum));
	}
	
	public static void main(String[] args) {
		String c = "1";
		System.out.println(getMapTradeChabun("a", c));
		System.out.println("getMemChabun(\"m\", c) >>> : " + ChabunUtil.getMemChabun("m", c));
		System.out.println("getBoardChabun(\"N\", c) >>> : " + ChabunUtil.getBoardChabun("N", c));
		System.out.println("getRboardChabun(\"N\", c) >>> : " + ChabunUtil.getRboardChabun("N", c));

		System.out.println("getNoticeChabun(\"N\", c) >>> : " + ChabunUtil.getNoticeChabun("N", c));
		System.out.println("getParkChabun(\"N\", c) >>> : " + ChabunUtil.getParkChabun("N", c));
		System.out.println("getRparkChabun(\"N\", c) >>> : " + ChabunUtil.getRparkChabun("N", c));

		System.out.println(".getNoticeChabun(\"N\", c) >>> : " + ChabunUtil.getNoticeChabun("N", c));
		System.out.println(".getAgencyChabun(\"N\", c) >>> : " + ChabunUtil.getAgencyChabun("m", c));
		System.out.print("getPetChabun() >>>>>" + ChabunUtil.getPetChabun(BIZ_GUBUN_PE, c));
		System.out.println(".getQnaChabun(\"N\", c) >>> : " + ChabunUtil.getQnaChabun("N", c));
		System.out.println("getPayChabun >>> : " + ChabunUtil.getPayChabun("m", c));
		System.out.println("getConditionChabun >>> : " + ChabunUtil.getConditionChabun("m", c));
	}

}
