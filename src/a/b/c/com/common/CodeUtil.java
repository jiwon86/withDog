package a.b.c.com.common;

public class CodeUtil {
	
	//Q&A 라벨
	public static final String[] qna_value = {"예정", "완료"};

	// 성별 라벨
	public static final String[] gender_value = {"여자", "남자"};
	
	// 핸드폰 라벨
	public static final String[] hp_value = {"010", "011", "016", "017"};
	
	// 전화번호 라벨
	public static final String[] tel_value = {"02", "031", "041", "051", "061"};
	
	// 취미 라벨
	public static final String[] hobby_lavel = {"알고리즘", "코딩", "분석설계", "데이터베이스", "스크립트"};
	public static final String[] hobby_value = {"01", "02", "03", "04", "05"};
	
	/*
	 * //qnaanswer public static String answer(String s) { return
	 * "01".equals(s.toUpperCase()) ? "예정" : "완료"; }
	 */
	
	// 생년월일
	public static String birth(String s) {
		String s0 = "";
		String s1 = "";
		String s2 = "";
		String ss = "";
		
		if(s != null && s.length() > 0) {
			int sLen = s.length();
			if(sLen == 8) {
				s0 = s.substring(0, 4);
				s1 = s.substring(4, 6);
				s2 = s.substring(6);
				ss = s0 + "-" + s1 + "-" + s2;
			}
		}
		return ss;
	}
	
	// 성별
	public static String gender(String s) {
		return "01".equals(s.toUpperCase()) ? "여자" : "남자";
	}
	
	// 전화번호
	public static String tel(String s) {
		String s0 = "";
		String s1 = "";
		String s2 = "";
		String ss = "";
		
		if(s != null && s.length() > 0) {
			int sLen = s.length();
			if(sLen == 9) {
				s0 = s.substring(0, 2);
				s1 = s.substring(2, 5);
				s2 = s.substring(5);
				ss = s0 + "-" + s1 + "-" + s2;
			}
			if(sLen == 10) {
				s0 = s.substring(0, 2);
				s1 = s.substring(2, 6);
				s2 = s.substring(6);
				ss = s0 + "-" + s1 + "-" + s2;
			}
			if(sLen == 11) {
				s0 = s.substring(0, 3);
				s1 = s.substring(3, 7);
				s2 = s.substring(7);
				ss = s0 + "-" + s1 + "-" + s2;
			}
		}
		
		return ss;
	}
	
	// 전화번호
	public static String hp(String s) {
		String s0 = "";
		String s1 = "";
		String s2 = "";
		String ss = "";
		
		if(s != null && s.length() > 0) {
			int sLen = s.length();
			if(sLen == 11) {
				s0 = s.substring(0, 3);
				s1 = s.substring(3, 7);
				s2 = s.substring(7);
				ss = s0 + "-" + s1 + "-" + s2;
			}
		}
		
		return ss;
	}
	
	// 취미들
	public static String hobbys(String s) {
		System.out.println(s);
		String h = "";
		String ss[] = s.split(",");
		for(int i=0; i<ss.length; i++) {
			System.out.println(hobby(ss[i]));
			h += hobby(ss[i]) + " ";
		}
		return h;
	}
	
	// 취미
	public static String hobby(String s) {
		String h = "";
		if(s != null && s.length() > 0) {
			for(int i=1; i<=hobby_lavel.length; i++) {
				if(("0" + i).equals(s)) {
					h = CodeUtil.hobby_lavel[i-1];
				}
			}
		}
		
		return h;
	}
	
	// 취미 value(코드) 세팅
	public static String setHbobby(String s) {
		String h = "";
		for(int i=0; i<CodeUtil.hobby_lavel.length; i++) {
			if(CodeUtil.hobby_lavel[i].equals(s)) {
				h = CodeUtil.hobby_value[i];
			}
		}
		
		return h;
	}
	
	// 취미, 직업 value(코드) 세팅
	public static int getComboIndex(String s) {
		int c = 0;
		if("01".equals(s)) { c=0; }
		if("02".equals(s)) { c=1; }
		if("03".equals(s)) { c=2; }
		if("04".equals(s)) { c=3; }
		if("05".equals(s)) { c=4; }
		if("06".equals(s)) { c=5; }
		
		return c;
	}
	
	
	public static void main(String[] args) {
		// 생년월일
		String b = CodeUtil.birth("20210801");
		System.out.println("b >>> : " + b);
		
		// 전화번호
		String t = CodeUtil.tel("03212341234");
		System.out.println("t >>> : " + t);
		
		// 핸드폰
		String hp = CodeUtil.tel("01012341234");
		System.out.println("hp >>> : " + hp);
		
		// 성별
		String g = CodeUtil.gender("02");
		System.out.println("g >>> : " + g);
		
		// 취미
		String h = CodeUtil.hobby("05");
		System.out.println("h >>> : " + h);
		
		// 취미들
		String hs = CodeUtil.hobbys("04,05");
		System.out.println("hs >>> : " + hs);
		
	}
}
