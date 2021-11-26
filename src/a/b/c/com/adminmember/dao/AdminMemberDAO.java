package a.b.c.com.adminmember.dao;

import java.util.List;

import a.b.c.com.member.vo.Member;

public interface AdminMemberDAO {
	
	public List<Member> AdminMemberSelect(Member member);
	// 전체조회
	public List<Member> AdminMemberSelectAll(Member member);
	// 수정하기
	public int AdminMemberUpdate(Member member);
	// 삭제하기
	public int AdminMemberDelete(Member member);
	
}
