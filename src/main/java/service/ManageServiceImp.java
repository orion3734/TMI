package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dto.ManageDTO;
import mapper.ManageMapper;

@Service
public class ManageServiceImp implements ManageService{
	@Autowired
	private ManageMapper mapper;

	@Override
	public List<ManageDTO> managePeopleProcess(String pro_id) {
		return mapper.pj_people(pro_id);
	}

	@Override
	public ManageDTO manageContentProcess(String pro_id) {
		return mapper.pj_content(pro_id);
	}

	@Override
	public void manageContentUpdateProcess(ManageDTO dto) {
		mapper.pj_content_upt(dto);
	}

	@Override
	public void managerResetProcess(String pro_id) {
		mapper.managerReset(pro_id);
	}

	@Override
	public void managerChangeProcess(ManageDTO dto) {
		mapper.managerChange(dto);
	}

	@Override
	public void managerProcess(ManageDTO dto) {
		mapper.manager(dto);
	}

	@Override
	public void memberAddProcess(ManageDTO dto) {
		mapper.addMember(dto);
	}
	
	@Override
	public List<String> idcheckProcess(String pro_id) {
		return mapper.idcheck(pro_id);
	}
	
	@Override
	public void memberDelProcess(ManageDTO dto) {
		mapper.delMember(dto);
		mapper.timeDelMem(dto);
		mapper.isSchLeader(dto);
	}

	@Override
	public void pjDelProcess(String pro_id) {
		mapper.pjDel(pro_id);
	}

	@Override
	public void pjpeopleDelProcess(String pro_id) {
		mapper.pjpeopleDel(pro_id);
	}

	@Override
	public List<String> searchIdList(String id) {
		return mapper.searchIdList(id);
	}

	@Transactional
	@Override
	public void rendSetProcess(ManageDTO dto) {
		mapper.setRend(dto);
		mapper.setSchRend(dto);
		mapper.setTdRend(dto);
	}
	
}
