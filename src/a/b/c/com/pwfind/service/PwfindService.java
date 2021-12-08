package a.b.c.com.pwfind.service;

import a.b.c.com.member.vo.Member;

public interface PwfindService {
	
	// 비밀번호 찾기
	public Member pwfinding(String memail);
	// 비밀번호 변경완료
	public int pwupdate(Member member);

}
