package a.b.c.com.member.vo;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

// 로그인 멤버 정보
public class CustomUserVO extends User {

	private static final long serialVersionUID = 1L;
	
	private MemberVO member;

	public CustomUserVO(String username, String password, 
					  Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	
	public CustomUserVO(MemberVO member) {
		super(member.getMid(), member.getMpw(), 
			  member.getAuthList().stream()
			  .map(auth -> new SimpleGrantedAuthority(auth.getMauth()))
			  .collect(Collectors.toList()));
		
		this.member = member;
	}

	public MemberVO getMember() {
		return member;
	}
	
}
