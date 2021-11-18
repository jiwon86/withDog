package a.b.c.com.member.service;

import java.util.List;

import a.b.c.com.member.vo.Member;
import a.b.c.com.member.vo.MemberAuth;

public interface MemberService {
	public Member memberSelect(String mid);
	public int memberUpdate(Member mvo);
	// 가입하기
	public int memberInsert(Member mvo);
	//로그인 체크
	public List<Member> loginCheck(Member mvo);
	// 중복 체크하기
	public List<Member> memberIdCheck(Member mvo);
	// 권한 추가
	public int memberAuthInsert(MemberAuth memberAuth);
	
}
