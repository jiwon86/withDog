package a.b.c.com.pet.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.b.c.com.pet.vo.PetVO;

@Repository
public class PetDAOImpl implements PetDAO {
		
	//로거
	Logger logger = Logger.getLogger(PetDAOImpl.class);
	
	//의존성 주입
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;


	
	@Override
	public List<PetVO> petSelectAll(PetVO pvo) {
		// TODO Auto-generated method stub
		logger.info("PetDAOImpl.petSelectAll 시작 >>>> ");
		
		return sqlSession.selectList("petSelectAll", pvo);
	}
//	@Override
//	public List<PetVO> petSelectAll1(String mno){
//		
//		return sqlSession.selectList("petSelectAll1", mno);
//		
//	}

	@Override
	public List<PetVO> petSelect(PetVO pvo) {
		// TODO Auto-generated method stub
		logger.info("PetDAOImpl.petSelect 시작 >>>> ");
		return sqlSession.selectList("petSelect", pvo);
	}

	@Override
	public int petInsert(PetVO pvo) {
		// TODO Auto-generated method stub
		logger.info("PetDAOImpl.petInsert 시작 >>>> ");
		return (Integer)sqlSession.insert("petInsert", pvo);
	}

	@Override
	public int petUpdate(PetVO pvo) {
		// TODO Auto-generated method stub
		logger.info("PetDAOImpl.petUpdate 시작 >>>> ");
		return (Integer)sqlSession.update("petUpdate", pvo);
	}

	@Override
	public int petDelete(PetVO pvo) {
		// TODO Auto-generated method stub
		logger.info("PetDAOImpl.petDelete 시작 >>>> ");
		return (Integer)sqlSession.update("petDelete", pvo);
	}

}
