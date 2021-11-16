package a.b.c.com.member.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import a.b.c.com.member.dao.MemberDAO;
import a.b.c.com.member.vo.Member;

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
	
}
