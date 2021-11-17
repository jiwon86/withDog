package a.b.c.com.member.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import a.b.c.com.member.dao.MemberDAO;
import a.b.c.com.member.vo.CustomUser;
import a.b.c.com.member.vo.Member;

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
		
		Member member = memberDAO.read(userName);
		
		return member == null ? null : new CustomUser(member);
	}

}
