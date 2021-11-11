package a.b.c.com.cgi.session;

import java.util.Enumeration;
import java.util.Hashtable;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

import oracle.net.aso.e;

public class K_SessionManager implements HttpSessionBindingListener {

	private static K_SessionManager kManager = null;
	
	// 사용자 id를 저장해 둘 Hashtable
	private static Hashtable hashManager = new Hashtable();
	
	// 생성자
	private K_SessionManager() {
		super();
	}
	
	// 싱글톤 기법
	public static synchronized K_SessionManager getInstance() {
		
		if(kManager == null) {
			kManager = new K_SessionManager();
		}
		
		return kManager;
	}
	
	// 해당 세션에서 이미 로그인을 했는지 확인
	// 세션아이디를 받아서 해당 세션이 로그인 상태이면 true, 아니면 false를 리턴.
	public boolean isLogin(String sessionID) {
		boolean isLogin = false;
		
		Enumeration e = hashManager.keys();
		String key = "";
		
		while(e.hasMoreElements()) {
			key = (String)e.nextElement();
			
			if(sessionID.equals(key)) {
				isLogin = true;
			}
		}
		
		return isLogin;
	}
	
	// 해당 아이디의 동시 사용을 막기위해
	// 이미 사용중인 아이디인지 확인
	// 유저아이디를 받아서 해당 유저가 세션을 사용중이면 true, 아니면 false를 리턴
	public boolean isUsing(String userID) {
		boolean isFlag = false;
		
		Enumeration e = hashManager.keys();
		String key = "";
		
		while(e.hasMoreElements()) {
			key = (String)e.nextElement();
			
			if(userID.equals(hashManager.get(key))) {
				isFlag = true;
			}
		}
		
		return isFlag;
	}
	
	// Hashtable에 세션아이디를 유저아이디를 짝지어 넣기. ==> 세션아이디로 유저아이디를 찾을 수 있게 함.
	// Hashtable을 세션에 넣기 ==> 세션을 통해 Hashtable에 접근할 수 있게함.
	public void setSession(HttpSession hSession, String userID) {
		hashManager.put(hSession.getId(), userID);
		hSession.setAttribute("login", this.getInstance());
	}
	
	// 세션이 성립되었을 때 자동으로 호출되는 메소드
	@Override
	public void valueBound(HttpSessionBindingEvent event) {
		// nothing
	}

	// 세션이 끊겼을 때 자동으로 호출되는 메소드
	// 세션이 끊겼으면 Hashtable에서 해당 세션의 정보를 삭제한다.
	@Override
	public void valueUnbound(HttpSessionBindingEvent event) {
		hashManager.remove(event.getSession().getId());
	}
	
	// 세션 ID로 현재 로그인한 ID를 구분해 냄
	public String getUserID(String sessionID) {
		return (String)hashManager.get(sessionID);
	}
	
	// 현재 접속자 수
	public int getUserCount() {
		return hashManager.size();
	}

}
