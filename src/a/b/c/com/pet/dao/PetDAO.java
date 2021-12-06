package a.b.c.com.pet.dao;

import java.util.List;

import a.b.c.com.pet.vo.PetVO;

public interface PetDAO {

	public List<PetVO> petSelectAll(PetVO pvo);
	public List<PetVO> petSelect(PetVO pvo);
	public int petInsert(PetVO pvo);
	public int petUpdate(PetVO pvo);
	public int petDelete(PetVO pvo);
//	public List<PetVO> petSelectAll1(String mno);
}
