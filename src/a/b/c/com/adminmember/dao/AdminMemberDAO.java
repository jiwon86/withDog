package a.b.c.com.adminmember.dao;

import java.util.List;

import a.b.c.com.member.vo.MemberVO;

public interface AdminMemberDAO {
	
	public List<MemberVO> AdminMemberSelect(MemberVO member);
	// 전체조회
	public List<MemberVO> AdminMemberSelectAll(MemberVO member);
	// 수정하기
	public int AdminMemberUpdate(MemberVO member);
	// 삭제하기
	public int AdminMemberDelete(MemberVO member);

}
