package mapper;

import java.util.List;

import dto.ManageDTO;

public interface ManageMapper {
	public List<ManageDTO> pj_people(String pro_id);
	
	public ManageDTO pj_content(String pro_id);
	
	public void pj_content_upt(ManageDTO dto);
	
	public void managerReset(String pro_id);
	
	public void managerChange(ManageDTO dto);
	
	public void manager(ManageDTO dto);
	
	public void addMember(ManageDTO dto);
	
	public List<String> idcheck(String pro_id);
	
	public void delMember(ManageDTO dto);
	
	public void timeDelMem(ManageDTO dto);
	
	public void pjDel(String pro_id);
	
	public void pjpeopleDel(String pro_id);
	
	public List<String> searchIdList(String id);
	
	public void setRend(ManageDTO dto);
	
	public void setSchRend(ManageDTO dto);
	
	public void setTdRend(ManageDTO dto);
	
	public void isSchLeader(ManageDTO dto);
}
