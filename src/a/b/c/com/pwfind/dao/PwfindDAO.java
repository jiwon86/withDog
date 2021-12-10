package a.b.c.com.pwfind.dao;

import a.b.c.com.member.vo.MemberVO;

public interface PwfindDAO {
	
	// 비밀번호 변경
	public MemberVO pwfinding(String memail);
	// 비밀번호 변경 완료
	public int pwupdate(MemberVO member);
}
