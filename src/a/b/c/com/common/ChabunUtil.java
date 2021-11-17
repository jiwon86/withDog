package a.b.c.com.common;

public abstract class ChabunUtil {
	
	public static final String BIZ_GUBUN_Q = "Q"; //Q&A
	
	
	public static final String BIZ_GUBUN_M = "M"; // 회원
	public static final String BIZ_GUBUN_B = "B"; // 게시판
	public static final String BIZ_GUBUN_RB = "RB"; // 게시판 댓글
	public static final String BIZ_GUBUN_N = "NB"; // 공지사항
	
	
	
	// type : D(20210001), M(YYYYMM), Y(YYYY)
	public static String numpad(String t, String c) {
		for(int i=c.length(); i<4; i++) {
			c = "0" + c;
		}
		
		String ymd = DateFormatUtil.ymdFormats(t);
		
		return ymd.concat(c);
	}
	
	//Q&A
	public static String getQnaChabun(String type, String mno) {
		
		return BIZ_GUBUN_Q.concat(ChabunUtil.numpad(type, mno));
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
	
	public static void main(String[] args) {
		String c = "1";
		System.out.println("getMemChabun(\"m\", c) >>> : " + ChabunUtil.getMemChabun("m", c));
		System.out.println("getBoardChabun(\"N\", c) >>> : " + ChabunUtil.getBoardChabun("N", c));
		System.out.println("getRboardChabun(\"N\", c) >>> : " + ChabunUtil.getRboardChabun("N", c));
		System.out.println(".getNoticeChabun(\"N\", c) >>> : " + ChabunUtil.getNoticeChabun("N", c));
	}
	
}
