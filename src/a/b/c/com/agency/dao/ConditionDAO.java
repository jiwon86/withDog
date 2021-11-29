package a.b.c.com.agency.dao;

import java.util.List;
import java.util.Map;

import a.b.c.com.agency.vo.ConditionVO;
import a.b.c.com.agency.vo.OfferVO;
import a.b.c.com.pet.vo.PetVO;

public interface ConditionDAO {
	public List<ConditionVO> conditionSelectAll(ConditionVO conditionVO);
	public List<ConditionVO> conditionSelect(ConditionVO conditionVO);
	public List<ConditionVO> myConditionSelectAll(ConditionVO conditionVO);
	public List<ConditionVO> myConditionSelect(ConditionVO conditionVO);
	public List<OfferVO> offerSelectAjax(OfferVO offerVO);
	public List<PetVO> petSelect(Map<String, Object> offerMap);
}
