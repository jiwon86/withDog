package a.b.c.com.park.service;

import java.util.List;

import a.b.c.com.park.vo.ParkVO;

public interface ParkService {
	
	public List<ParkVO> parkSelectAll();
	public List<ParkVO> parkSelect(ParkVO svo);
	public int parkInsert(ParkVO svo);
	public int parkUpdate(ParkVO svo);
	public int parkDelete(ParkVO svo);

}
