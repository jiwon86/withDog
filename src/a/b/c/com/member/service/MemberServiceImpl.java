package a.b.c.com.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import a.b.c.com.member.dao.MemberDAO;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {
	
	private MemberDAO memberDAO;
	
	@Autowired(required=false)
	public MemberServiceImpl(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}
	
}
