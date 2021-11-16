package a.b.c.com.member.service;

import a.b.c.com.member.vo.Member;

public interface MemberService {
	public Member memberSelect(String mid);
	public int memberUpdate(Member mvo);
}
