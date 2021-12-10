package a.b.c.com.pwfind.service;

import a.b.c.com.member.vo.MemberVO;

public interface PwfindService {
	
	// 비밀번호 찾기
	public MemberVO pwfinding(String memail);
	// 비밀번호 변경완료
	public int pwupdate(MemberVO member);

}
