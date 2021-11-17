package a.b.c.com.pet.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import a.b.c.com.pet.dao.PetDAO;
import a.b.c.com.pet.vo.PetVO;

@Service
@Transactional
public class PetServiceImpl implements PetService {
	
	//로거
	Logger logger = Logger.getLogger(PetServiceImpl.class);

	//다오 연결
	private PetDAO petDAO;
	
	//의존성 연결
	public PetServiceImpl(PetDAO petDAO) {
		this.petDAO =petDAO;
	}
	
	//전체조회---------------------------------------------------
	@Override
	public List<PetVO> petSelectAll(PetVO pvo) {
		// TODO Auto-generated method stub
		logger.info("PetServiceImpl.petSelectAll 시작 >>>>>> ");
		return petDAO.petSelectAll(pvo);
	}

	//선택조회---------------------------------------------------
	@Override
	public List<PetVO> petSelect(PetVO pvo) {
		// TODO Auto-generated method stub
		logger.info("PetServiceImpl.petSelect 시작 >>>>>> ");
		return petDAO.petSelect(pvo);
	}

	//추가하기---------------------------------------------------
	@Override
	public int petInsert(PetVO pvo) {
		// TODO Auto-generated method stub
		logger.info("PetServiceImpl.petInsert 시작 >>>>>> ");
		return petDAO.petInsert(pvo);
	}

	//수정하기---------------------------------------------------
	@Override
	public int petUpdate(PetVO pvo) {
		// TODO Auto-generated method stub
		logger.info("PetServiceImpl.petUpdate 시작 >>>>>> ");
		return petDAO.petUpdate(pvo);
	}

	//삭제하기---------------------------------------------------
	@Override
	public int petDelete(PetVO pvo) {
		// TODO Auto-generated method stub
		logger.info("PetServiceImpl.petDelete 시작 >>>>>> ");
		return petDAO.petDelete(pvo);
	}

}
