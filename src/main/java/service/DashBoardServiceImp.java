package service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dto.DashDTO;
import dto.ProjectDTO;
import dto.ScheduleDTO;
import dto.TodoDTO;
import mapper.DashBoardMapper;
import mapper.ProjectMapper;

@Service
public class DashBoardServiceImp implements DashBoardService{

	
	@Autowired
	private DashBoardMapper mapper;
	@Autowired
	private ProjectMapper pjMapper;
	
	public DashBoardServiceImp() {
	}
	
	@Override
	public int pjcntProcess(String id) {
		return mapper.pjcnt(id);
	}

	@Override
	public int AlltodoProcess(String id) {
		return mapper.alltodocnt(id);
	}

	@Override
	public int remaincntProcess(String id) {
		return mapper.remaincnt(id);
	}

	@Override
	public int completecntProcess(String id) {
		return mapper.compcnt(id);
	}

	@Override
	public List<DashDTO> recentlistProcess(int pro_id) {
		return mapper.recentlist(pro_id);
	}

	@Override
	public List<DashDTO> commingProcess(String id) {
		return mapper.comminglist(id);
	}

	@Override
	public List<DashDTO> timelineProcess(String id) {
		return mapper.timelist(id);
	}
	
	@Override
	public void bgChange(DashDTO dto) {
		mapper.bgChange(dto);
	}

	@Override
	public String bgViewProcess(String id) {
		return mapper.bgView(id);
	}

	@Override
	public List<DashDTO> topListProcess(int pro_id) {
		return mapper.toplist(pro_id);
	}
	
	public List<DashDTO> donutgraphProcess(String id){
		return mapper.donutgraph(id);
	}
	
	@Override
	public List<HashMap<String, Object>> graphProcess(HashMap<String, String> map) {
		String pro_id = map.get("pro_id");
		String id = map.get("id");
		ProjectDTO pdto = pjMapper.proSelect(pro_id);
		List<TodoDTO> tList = pjMapper.tdProidSelect(pro_id);
		int tdTotal = tList.size();
		List<TodoDTO> tListEnd = pjMapper.tdProidSelectRend(pro_id);
		if(tList.size()==0||tListEnd.size()==0) {
			return null;
		}
		SimpleDateFormat parse = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
		List<HashMap<String, Object>> result = new ArrayList<>();
		HashMap<String, Object> zero = new HashMap<>();
		try {
			zero.put("date", format.format(parse.parse(pjMapper.proSelect(pro_id).getPro_start().substring(0, 10))));
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		zero.put("value", 0);
		result.add(zero);
		
		for (int i=0; i<tListEnd.size(); i++) {
			TodoDTO todoDTO = tListEnd.get(i);
			String tomorrow = "";
			String today = "";
			HashMap<String, Object> rendPer = new HashMap<>();
			try {
				if(i!=tListEnd.size()-1) {
					tomorrow = format.format(parse.parse(tListEnd.get(i+1).getT_rend().substring(0, 10)));
				}
				today = format.format(parse.parse(todoDTO.getT_rend().substring(0, 10)));
				if(tomorrow.equals(today)) {
					continue;
				}
				rendPer.put("date", today);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			int lastIdx = todoDTO.getT_rend().indexOf(".");
			String t_rend = todoDTO.getT_rend();
			if(lastIdx>0) {
				t_rend = todoDTO.getT_rend().substring(0, lastIdx);
			}
			int curCnt = pjMapper.tdRendCompare(pro_id, t_rend).size();
			rendPer.put("value", Math.round((double)curCnt/(double)tdTotal*100));
			result.add(rendPer);
		}
		return result;
	}
	
}
