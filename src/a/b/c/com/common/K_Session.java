package a.b.c.com.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class K_Session {
	
	private static final String K_SESSION_ID = "KID";
	
	// 싱글톤 패턴 : Singleton Pattern
	private static class LazyHolder {
		public static final K_Session SESSIONLISTENER_INSTANCE = new K_Session();
	}
	
	public static K_Session getInstance() {
		return LazyHolder.SESSIONLISTENER_INSTANCE;
	}
	
	public K_Session() {
		super();
	}
	
	public void killSession(final HttpServletRequest hReq) {
		HttpSession hSession = hReq.getSession(false);
		if(hSession != null) {
			hSession.removeAttribute(K_SESSION_ID);
			hSession.invalidate();
		}
	}
	
	public boolean setSession(final HttpServletRequest hReq, final String userID) {
		HttpSession hSession = hReq.getSession();
		String k_session_val = (String)hSession.getAttribute(K_SESSION_ID);
		int nCnt = 0;
		
		if(k_session_val != null) {
			boolean b1 = k_session_val.equals(userID);
			
			if(b1) {
				nCnt++;
			} else {
				System.out.println("세션 없음 >>> : ");
			}
		} else {
			System.out.println("세션 없음 >>> : ");
		}
		
		if(nCnt == 0) {
			//hSession.invalidate();
			hSession.setAttribute(K_SESSION_ID, userID);
			hSession.setMaxInactiveInterval(60*60);
			
			return false;
		}
		
		return true;
	}
	
	public String getSession(final HttpServletRequest hReq) {
		String strSession = "";
		HttpSession hSession = hReq.getSession(false);
		if(hSession != null) {
			strSession = (String)hSession.getAttribute(K_SESSION_ID);
		}
		return strSession;
	}
	
}
