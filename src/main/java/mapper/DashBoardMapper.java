package mapper;

import java.util.HashMap;
import java.util.List;

import dto.DashDTO;

public interface DashBoardMapper {
	
	public int pjcnt(String id);
	
	public int alltodocnt(String id);
	
	public int remaincnt(String id);
	
	public int compcnt(String id);
	
	
	
	//top5 List
	public List<DashDTO> toplist(int pro_id);
	//도넛 그래프
	public List<DashDTO> donutgraph(String id);
	//최근일정 목록
	public List<DashDTO> recentlist(int pro_id);
	//다가오는 일정 목록
	public List<DashDTO> comminglist(String id);
	//타임라인 
	public List<DashDTO> timelist(String id);
	// 배경화면 
	public String bgView(String id);
	// 배경화면
	public void bgChange(DashDTO DTO);
	//그래프
	public List<DashDTO> graphlist(HashMap<String, String> map);
	
}
