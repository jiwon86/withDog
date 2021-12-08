package a.b.c.com.agency.service;

import java.util.List;

import a.b.c.com.agency.vo.AgencyVO;
import a.b.c.com.agency.vo.ConditionVO;
import a.b.c.com.agency.vo.PayVO;

public interface AgencyService {
	public int agencySelectCount(AgencyVO avo);
	public int agencyInsert(AgencyVO avo);
	public List<AgencyVO> agencyMatchyn(AgencyVO avo);
	public int agencyUpdateN(AgencyVO avo);
	public int agencyUpdateY(AgencyVO avo);
	public int payAjax(PayVO pvo);
	public List<PayVO> paySelect(PayVO pvo);
	public int payCount(PayVO pvo);
	public List<PayVO> paySelectPayno(PayVO pvo);
	public List<PayVO> paySelectAll(PayVO pvo);
}
