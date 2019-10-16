package service;

import java.util.List;

import dto.ManageDTO;

public interface ManageService {
	public List<ManageDTO> managePeopleProcess(String pro_id);
	
	public ManageDTO manageContentProcess(String pro_id);
	
	public void manageContentUpdateProcess(ManageDTO dto);
	
	public void managerResetProcess(String pro_id);
	
	public void managerChangeProcess(ManageDTO dto);
	
	public void managerProcess(ManageDTO dto);
	
	public void memberAddProcess(ManageDTO dto);
	
	public List<String> idcheckProcess(String pro_id);
	
	public void memberDelProcess(ManageDTO dto);
	
	public void pjDelProcess(String pro_id);
	
	public void pjpeopleDelProcess(String pro_id);
	
	public List<String> searchIdList(String id);
	
	public void rendSetProcess(ManageDTO dto);
}
