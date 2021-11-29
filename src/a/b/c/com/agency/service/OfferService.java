package a.b.c.com.agency.service;

import java.util.List;
import java.util.Map;

import a.b.c.com.agency.vo.OfferVO;
import a.b.c.com.pet.vo.PetVO;

public interface OfferService {
	public List<OfferVO> offerSelectAll(OfferVO offerVO);
	public List<OfferVO> offerSelect(OfferVO ovo);
	public List<PetVO> petSelectAll(Map<String, Object> offerMap);
}
