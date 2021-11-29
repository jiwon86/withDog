package a.b.c.com.agency.service;

import java.util.List;

import a.b.c.com.agency.vo.AgencyVO;

public interface AgencyService {
	public int agencySelectCount(AgencyVO avo);
	public int agencyInsert(AgencyVO avo);
	public List<AgencyVO> agencyMatchyn(AgencyVO avo);
	public int agencyUpdateN(AgencyVO avo);
	public int agencyUpdateY(AgencyVO avo);
}
