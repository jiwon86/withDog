package a.b.c.com.agency.dao;

import java.util.List;

import a.b.c.com.agency.vo.AgencyVO;
import a.b.c.com.agency.vo.PayVO;

public interface AgencyDAO {
	public int agencySelectCount(AgencyVO avo);
	public int agencyInsert(AgencyVO avo);
	public List<AgencyVO> agencyMatchyn(AgencyVO avo);
	public int agencyUpdateN(AgencyVO avo);
	public int agencyUpdateY(AgencyVO avo);
	public int payAjax(PayVO pvo);
	public List<PayVO> paySelect(PayVO pvo);
	public int payCount(PayVO pvo);
}
