package a.b.c.com.pwfind.dao;

import a.b.c.com.member.vo.Member;

public interface PwfindDAO {
	
	// 비밀번호 변경
	public Member pwfinding(String memail);
	// 비밀번호 변경 완료
	public int pwupdate(Member member);
}
