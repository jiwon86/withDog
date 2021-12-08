package a.b.c.com.pwfind.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import a.b.c.com.member.vo.Member;
import a.b.c.com.pwfind.dao.PwfindDAO;

@Service
@Transactional
public class PwfindServiceImpl implements PwfindService {
	
	Logger logger = Logger.getLogger(PwfindServiceImpl.class);
	
	private PwfindDAO pwfindDAO;
	
	@Autowired(required=false)
	public PwfindServiceImpl(PwfindDAO pwfindDAO) {
		this.pwfindDAO = pwfindDAO;
	}

	@Override
	public Member pwfinding(String memail) {
		logger.info("pw찾기 service쪽 실행 ");
		return pwfindDAO.pwfinding(memail);
	}
	
	@Override
	public int pwupdate(Member member) {
		logger.info("pwupdate Service쪽 실행 >>> : ");
		return (Integer)pwfindDAO.pwupdate(member);
	}
	

}
