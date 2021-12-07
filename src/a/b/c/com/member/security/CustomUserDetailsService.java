package a.b.c.com.member.security;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import a.b.c.com.member.dao.MemberDAO;
import a.b.c.com.member.vo.CustomUserVO;
import a.b.c.com.member.vo.MemberVO;

public class CustomUserDetailsService implements UserDetailsService {

	private MemberDAO memberDAO;
	
	public CustomUserDetailsService() {
		
	}
	
	@Autowired(required = false)
	public CustomUserDetailsService(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}
	
	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		
		List<MemberVO> memberList = memberDAO.read(userName);
		MemberVO _member = memberList.get(0);
		
		return _member == null ? null : new CustomUserVO(_member);
	}

}
