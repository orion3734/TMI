package service;

import java.util.HashMap;
import java.util.List;

import dto.DashDTO;

public interface DashBoardService {
	
	public int pjcntProcess(String id);
	
	public int AlltodoProcess(String id);
	
	public int remaincntProcess(String id);
	
	public int completecntProcess(String id);
	
	
	//top5기여도
	public List<DashDTO> topListProcess(int pro_id);
	//도넛 그래프
	public List<DashDTO> donutgraphProcess(String id);
	//최근일정 목록
	public List<DashDTO> recentlistProcess(int pro_id);
	//다가오는 일정 목록
	public List<DashDTO> commingProcess(String id);
	//타임라인
	public List<DashDTO> timelineProcess(String id);
	
	//배경화면 가져오기
	public String bgViewProcess(String id);
	
	//배경화면 업데이트
	public void bgChange(DashDTO dto);
	
	//그래프
	public List<HashMap<String, Object>> graphProcess(HashMap<String, String> map);
	
}
