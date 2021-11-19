package a.b.c.com.member.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import a.b.c.com.member.dao.MemberDAO;
import a.b.c.com.member.vo.Member;
import a.b.c.com.member.vo.MemberAuth;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {

	private Logger logger = Logger.getLogger(MemberServiceImpl.class);

	private MemberDAO memberDAO;

	@Autowired(required=false)
	public MemberServiceImpl(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}

	@Override
	public Member memberSelect(String mid) {
		logger.info("MemberServiceImpl.memberSelect() 함수 진입");

		return memberDAO.memberSelect(mid);
	}

	@Override
	public int memberUpdate(Member mvo) {
		logger.info("MemberServiceImpl.memberUpdate() 함수 진입");

		return memberDAO.memberUpdate(mvo);
	}
	// 가입하기
	@Override
	public int memberInsert(Member mvo) {
		logger.info("MemberServiceImpl.memberInsert() 함수 진입");
		return (Integer)memberDAO.memberInsert(mvo);
	}
	// 중복 체크하기
	@Override
	public List<Member> memberIdCheck(Member mvo){
		logger.info("MemberServiceImpl.memberIdCheck() 함수 진입");
		return memberDAO.memberIdCheck(mvo);
	}

	@Override
	public int memberAuthInsert(MemberAuth memberAuth) {
		logger.info("MemberServiceImpl.memberAuthInsert() 함수 진입");
		return memberDAO.memberAuthInsert(memberAuth);
	}

}
