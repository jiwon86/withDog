package a.b.c.com.adminmember.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.b.c.com.member.vo.Member;

@Repository
public class AdminMemberDAOImpl implements AdminMemberDAO {
	
	Logger logger = Logger.getLogger(getClass());
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Member> AdminMemberSelect(Member member) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("AdminMemberSelect",member);
	}

	@Override
	public List<Member> AdminMemberSelectAll(Member member) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("AdminMemberSelectAll",member);
	}

	@Override
	public int AdminMemberUpdate(Member member) {
		// TODO Auto-generated method stub
		return (Integer)sqlSession.update("AdminMemberUpdate",member);
	}

	@Override
	public int AdminMemberDelete(Member member) {
		// TODO Auto-generated method stub
		return (Integer)sqlSession.delete("AdminMemberDelete", member);
	}
	
	

}
