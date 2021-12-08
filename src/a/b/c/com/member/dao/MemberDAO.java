package a.b.c.com.member.dao;

import java.util.List;

import a.b.c.com.member.vo.MemberVO;
import a.b.c.com.member.vo.MemberAuthVO;

public interface MemberDAO {
	public List<MemberVO> read(String userId);
	public List<MemberVO> memberSelect(MemberVO mvo);
	public int memberUpdate(MemberVO mvo);
	// 가입하기
	public int memberInsert(MemberVO mvo);
	//로그인 체크
	public List<MemberVO> loginCheck(MemberVO mvo);
	// 중복 체크하기
	public List<MemberVO> memberIdCheck(MemberVO mvo);
	// 권한 추가
	public int memberAuthInsert(MemberAuthVO memberAuth);
	// 포인트 업데이트
	public int updatePoint(MemberVO mvo);

}
