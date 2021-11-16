package a.b.c.com.member.dao;

import a.b.c.com.member.vo.Member;

public interface MemberDAO {
	public Member read(String userId);
	public Member memberSelect(String mid);
	public int memberUpdate(Member mvo);
}
