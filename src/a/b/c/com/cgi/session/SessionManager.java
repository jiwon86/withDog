package a.b.c.com.cgi.session;

import java.util.Collection;
import java.util.Enumeration;
import java.util.Hashtable;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

public class SessionManager implements HttpSessionBindingListener {

	private static Hashtable<Object, Object> sessionUser = new Hashtable<Object, Object>();
	
	// 싱글톤 패턴 : Singleton pattern
	// 미국 메릴랜드 대학의 컴퓨터 과학 연구원인 Bill pugh
	private static class LazyHolder {
		public static final SessionManager SESSIONLISTENER_INSTANCE = new SessionManager();
	}
	
	public static SessionManager getInstance() {
		return LazyHolder.SESSIONLISTENER_INSTANCE;
	}
	
	public SessionManager() {
		super();
	}
	
	// 1. 세션이 연결되었을 때 호출 : session.setAttribute("key", value);
	// 2. 해쉬테이블에 세션과 접속자 아이디 저장
	@Override
	public void valueBound(HttpSessionBindingEvent hbindEvent) {
		System.out.println("HttpSessionBindingListener:::valueBound() >>> : ");
		
		sessionUser.put(hbindEvent.getSession(), hbindEvent.getName());
		System.out.println(hbindEvent.getName() + " 로그인 완료 " + hbindEvent);
		System.out.println("valueBound::현재 접속자 수 >>> : " + getUserCount());
	}

	// 1. 세션이 끊겼을 때 호출 : session.invalidate
	// 2. 해쉬테이블에 저장된 로그인 정보를 삭제한다.
	@Override
	public void valueUnbound(HttpSessionBindingEvent hbindEvent) {
		System.out.println("HttpSessionBindingEvent:::valueUnbound() >>> : ");
		
		sessionUser.remove(hbindEvent.getSession());
		System.out.println(hbindEvent.getName() + " 로그아웃 완료 " + hbindEvent.getValue());
		System.out.println("valueBound::현재 접속자 수 >>> : " + getUserCount());
	}

	// 입력받은 아이디를 해쉬테이블에서 삭제
	public void removeSession(String userID) {
		Enumeration<Object> e = sessionUser.keys();
		HttpSession hSession = null;
		while(e.hasMoreElements()) {
			hSession = (HttpSession)e.nextElement();
			if(sessionUser.get(hSession).equals(userID)) {
				hSession.invalidate();
			}
		}
	}
	
	// 해당 세션에서 이미 로그인을 했는지 확인
	// 세션 아이디를 받아서 해당 세션이 로그인 상태 확인
	public boolean isLogin(String sessionID) {
		boolean isLogin = false;
		Enumeration<Object> e = sessionUser.keys();
		String key = "";
		
		while(e.hasMoreElements()) {
			key = (String)e.nextElement();
			if(key.equals(sessionID)) {
				isLogin = true;
			}
		}
		return isLogin;
	}
	
	// 해당 아이디의 동시 사용을 해쉬테이블에서 체크하기
	public boolean isUsing(String userID) {
		return sessionUser.containsValue(userID);
	}
	
	// 로그인을 완료한 사용자의 아이디를 세션에 저장한다.
	public void setSession(HttpSession hSession, String userID) {
		// 1. HttpSessionBindingLinstener를 구현하는 클래스의 valueUnbound() 함수 호출
		// 2. key 값으로 userId
		// 3. value값으로 자기자신(HttpSessionBindingListener를 구현하는 Object)
		hSession.setAttribute(userID, this);
	}
	
	// 입력받은 세션 Object를 아이디로 리턴
	public String getUserID(HttpSession hSession) {
		return String.valueOf(sessionUser.get(hSession));
	}
	
	// 현재 접속한 사용자 수 : 해쉬테이블 사이즈
	public int getUserCount() {
		return sessionUser.size();
	}
	
	// 현재 접속한 모든 사용자 아이디 출력
	public void printLoginUser() {
		Enumeration<Object> e = sessionUser.keys();
		HttpSession hSession = null;
		
		System.out.println("==============================");
		int i = 0;
		while(e.hasMoreElements()) {
			hSession = (HttpSession)e.nextElement();
			System.out.println((++i) + ". 접속자 : " + sessionUser.get(hSession));
		}
		System.out.println("==============================");
	}
	
	public Collection getUsers() {
		Collection c = sessionUser.values();
		return c;
	}
	
}

/*
	HashMap VS Hashtable
	1. Thread-safe
		해쉬맵 Thread-safe 지원하지 않음
		해쉬테이블 Thread-safe 지원 : 멀티 스레드 환경이 아니면 해시맵보다 성능이 떨어짐
	2. NULL
		해시맵 : key에 null 허용
		해시테이블 : key에 null을 허용하지 않음
	3. Enumeration
		해시맵은 해시테이블을 제공하지 않음
		해쉬테이블은 not fail-fast 해시테이블을 제공
	
	HashMap은 보조해쉬를 사용하기 때문에 보조 해쉬 함수를 사용하지 않는
	Hashtable에 비하여 해쉬 충돌(hash collision)이 덜 발생할 수 있어
	상대적으로 성능상 이점이 있음
*/

// 싱글톤
/*
	private static SessionListener sListener = null;
	public static synchronized SessionListener getInstance() {
		if(sListener == null) {
			sListener = new SessionListener();
		}
		return sListener;
*/

/*
	private volatile static SessionListener sListener;
	public static SessionListener getInstance() {
		if(sListener == null) {
			synchronized(SessionListener.class) {
				if(sListener == null) {
					sListener = new SessionListener();
				}
			}
		}
		return sListener;
	}
*/
