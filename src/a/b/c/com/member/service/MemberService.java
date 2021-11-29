package a.b.c.com.member.service;

import java.util.List;

import a.b.c.com.member.vo.MemberVO;
import a.b.c.com.member.vo.MemberAuth;

public interface MemberService {
	public List<MemberVO> memberSelect(MemberVO mvo);
	public int memberUpdate(MemberVO mvo);
	// 가입하기
	public int memberInsert(MemberVO mvo);
	//로그인 체크
	public List<MemberVO> loginCheck(MemberVO mvo);
	// 중복 체크하기
	public List<MemberVO> memberIdCheck(MemberVO mvo);
	// 권한 추가
	public int memberAuthInsert(MemberAuth memberAuth);
	
}
