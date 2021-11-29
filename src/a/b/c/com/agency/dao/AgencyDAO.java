package a.b.c.com.agency.dao;

import java.util.List;

import a.b.c.com.agency.vo.AgencyVO;

public interface AgencyDAO {
	public int agencySelectCount(AgencyVO avo);
	public int agencyInsert(AgencyVO avo);
	public List<AgencyVO> agencyMatchyn(AgencyVO avo);
	public int agencyUpdateN(AgencyVO avo);
	public int agencyUpdateY(AgencyVO avo);
}
