package a.b.c.com.pet.service;

import java.util.List;

import a.b.c.com.pet.vo.PetVO;

public interface PetService {

	public List<PetVO> petSelectAll(PetVO pvo);
	public List<PetVO> petSelect(PetVO pvo);
	public int petInsert(PetVO pvo);
	public int petUpdate(PetVO pvo);
	public int petDelete(PetVO pvo);
	
}
