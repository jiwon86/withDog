package a.b.c.com.agency.dao;

import java.util.List;
import java.util.Map;

import a.b.c.com.agency.vo.ConditionVO;
import a.b.c.com.agency.vo.OfferVO;
import a.b.c.com.pet.vo.PetVO;

public interface OfferDAO {
	public List<OfferVO> offerSelectAll(OfferVO offerVO);
	public List<OfferVO> offerSelect(OfferVO ovo);
	public List<PetVO> petSelectAll(Map<String, Object> offerMap);	
	public int offerUpdatePropose(OfferVO ovo);
}
