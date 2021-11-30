package a.b.c.com.park.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.b.c.com.park.vo.ParkVO;

@Repository
public class ParkDAOImpl implements ParkDAO {

	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int parkInsert(ParkVO svo) {
		return (Integer)sqlSession.insert("parkInsert",svo);
	}
	
	@Override
	public List<ParkVO> parkSelectAll() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("parkSelectAll");
	}

	@Override
	public int parkUpdate(ParkVO svo) {
		// TODO Auto-generated method stub
		return (Integer)sqlSession.update("parkUpdate",svo);
	}

	@Override
	public int parkDelete(ParkVO svo) {
		// TODO Auto-generated method stub
		return (Integer)sqlSession.update("parkDelete",svo);
	}

	@Override
	public List<ParkVO> parkSelect(ParkVO svo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("parkSelect", svo);
	}

}
