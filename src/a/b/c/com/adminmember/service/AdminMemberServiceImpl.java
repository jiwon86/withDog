package a.b.c.com.adminmember.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import a.b.c.com.adminmember.dao.AdminMemberDAO;
import a.b.c.com.member.vo.MemberVO;

@Service
@Transactional
public class AdminMemberServiceImpl implements AdminMemberService {

//	Logger logger = Logger.getLogger(AdminMemberServiceImpl.class);
	
	private AdminMemberDAO adminMemberDAO;
	
	@Autowired(required=false)
	public AdminMemberServiceImpl(AdminMemberDAO adminMemberDAO) {
	this.adminMemberDAO = adminMemberDAO;
}

	@Override
	public List<MemberVO> AdminMemberSelect(MemberVO member) {
		// TODO Auto-generated method stub
		return adminMemberDAO.AdminMemberSelect(member);
	}

	@Override
	public List<MemberVO> AdminMemberSelectAll(MemberVO member) {
		// TODO Auto-generated method stub
		return adminMemberDAO.AdminMemberSelectAll(member);
	}

	@Override
	public int AdminMemberUpdate(MemberVO member) {
		// TODO Auto-generated method stub
		return (Integer)adminMemberDAO.AdminMemberUpdate(member);
	}

	@Override
	public int AdminMemberDelete(MemberVO member) {
		// TODO Auto-generated method stub
		return (Integer)adminMemberDAO.AdminMemberDelete(member);
	}

}
