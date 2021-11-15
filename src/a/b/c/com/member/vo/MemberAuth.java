package a.b.c.com.member.vo;

import java.io.Serializable;

// 멤버 권한 VO객체
public class MemberAuth implements Serializable {

	private static final long serialVersionUID = 4546733454098142739L;

	private String mno;
	private String mauth;
	
	public MemberAuth() {
		
	}
	
	public MemberAuth(String mno, String mauth) {
		this.mno = mno;
		this.mauth = mauth;
	}

	public String getMno() {
		return mno;
	}

	public void setMno(String mno) {
		this.mno = mno;
	}

	public String getMauth() {
		return mauth;
	}

	public void setMauth(String mauth) {
		this.mauth = mauth;
	}	
	
}
