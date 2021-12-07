package a.b.c.com.adminmember.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.b.c.com.member.vo.MemberVO;

@Repository
public class AdminMemberDAOImpl implements AdminMemberDAO {
	
	Logger logger = Logger.getLogger(getClass());
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;

	@Override
	public List<MemberVO> AdminMemberSelect(MemberVO member) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("AdminMemberSelect",member);
	}

	@Override
	public List<MemberVO> AdminMemberSelectAll(MemberVO member) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("AdminMemberSelectAll",member);
	}

	@Override
	public int AdminMemberUpdate(MemberVO member) {
		// TODO Auto-generated method stub
		return (Integer)sqlSession.update("AdminMemberUpdate",member);
	}

	@Override
	public int AdminMemberDelete(MemberVO member) {
		// TODO Auto-generated method stub
		return (Integer)sqlSession.delete("AdminMemberDelete", member);
	}

}
