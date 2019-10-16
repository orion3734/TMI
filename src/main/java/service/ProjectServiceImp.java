package service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dto.NotiDTO;
import dto.Pro_TeamDTO;
import dto.ProjectDTO;
import dto.Sch_TeamDTO;
import dto.ScheduleDTO;
import dto.TimelineDTO;
import dto.TodoDTO;
import lombok.extern.log4j.Log4j2;
import mapper.ProjectMapper;
import mapper.TimelineMapper;

@Service
public class ProjectServiceImp implements ProjectService{
	@Autowired
	private ProjectMapper mapper;
	
	
	@Transactional
	@Override
	public void insertProject(ProjectDTO pdto, String id, List<String> pro_team_list) {
		// TODO Auto-generated method stub
		Pro_TeamDTO ptDto = new Pro_TeamDTO();
		try {
			pdto.setPro_mgr(id);
			mapper.firstInsertProject(pdto);
			
			ptDto.setId(id);
			ptDto.setPt_level(1);
			mapper.firstInsertProTeam(ptDto);
			if(pro_team_list!=null) {
				for (String string : pro_team_list) {
					NotiDTO nDto = new NotiDTO();
					nDto.setId(string);
					nDto.setState(0);
					nDto.setNoti_id(id);
					mapper.inviteProTeam(nDto);
				}
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	@Override
	public List<HashMap<String, Object>> projectHomeList(String id) {
		// TODO Auto-generated method stub
		List<HashMap<String, Object>> homeList = mapper.projectHomeList(id);
		
		for (HashMap<String, Object> hashMap : homeList) {
			Double tdCntAvgSum = 0.0;
			List<ScheduleDTO> schSelect = mapper.schSelect(hashMap.get("pro_id").toString());
			List<ScheduleDTO> schSelectEnd = mapper.schSelectEnd(hashMap.get("pro_id").toString());
			for(ScheduleDTO scheduleDTO :schSelect) {
				int tdCnt = mapper.tdSelect(scheduleDTO.getSch_id()).size();
				int tdEndCnt = mapper.tdSelectEnd(scheduleDTO.getSch_id()).size();
				if(tdCnt==0||tdEndCnt==0) {
					if(mapper.isSchEnd(scheduleDTO.getSch_id())!=null){
						tdCntAvgSum++;
					}
					continue;
				}
				tdCntAvgSum += (double)tdEndCnt/(double)tdCnt;
			}
			
			if(schSelect.size()==0) {
				hashMap.put("pro_per", (Math.round(tdCntAvgSum))+"%");
				continue;
			}
			hashMap.put("pro_per", (Math.round(tdCntAvgSum/(double)schSelect.size()*100))+"%");
		}
		return homeList;
	}
	
	@Override
	public List<Integer> proIdList(String id) {
		// TODO Auto-generated method stub
		return mapper.proIdList(id);
	}

	@Override
	public List<String> searchIdList(String id) {
		// TODO Auto-generated method stub
		return mapper.searchIdList(id);
	}
	
	@Override
	public List<ProjectDTO> calendarPro(String pro_id, String id) {
		// TODO Auto-generated method stub
		List<ProjectDTO> proList = mapper.calendarPro(pro_id, id);
		return proList;
	}
	
	@Override
	public List<ScheduleDTO> calendarSchTd(String pro_id) {
		// TODO Auto-generated method stub
		List<ScheduleDTO> schList = mapper.calendarSch(pro_id);
		for (ScheduleDTO scheduleDTO : schList) {
			scheduleDTO.setTodoList(mapper.calendarTodo(scheduleDTO.getSch_id()));
			scheduleDTO.setStList(mapper.schTeamSelectById(scheduleDTO.getSch_id()));
		}
		return schList;
	}
	
	@Override
	public ProjectDTO proSelect(String pro_id) {
		// TODO Auto-generated method stub
		return mapper.proSelect(pro_id);
	}
	
	@Override
	public ScheduleDTO schOneSelect(String sch_id) {
		// TODO Auto-generated method stub
		ScheduleDTO sdto = mapper.schOne(sch_id);
		List<Sch_TeamDTO> stList = mapper.schTeamSelectById(sch_id);
		sdto.setStList(stList);
		for (Sch_TeamDTO sch_TeamDTO : stList) {
			sch_TeamDTO.setCntTd(mapper.cntTodo(sch_TeamDTO.getSch_id(), sch_TeamDTO.getId()));
			sch_TeamDTO.setCntEndTd(mapper.cntEndTodo(sch_TeamDTO.getSch_id(), sch_TeamDTO.getId()));
		}
		List<TodoDTO> tList = mapper.tdViewSelect(sch_id);
		for (TodoDTO todoDTO : tList) {
			todoDTO.setId(mapper.getTdId(todoDTO.getT_id()));
		}
		sdto.setTodoList(tList);
		return sdto;
	}
	
	@Override
	public List<ScheduleDTO> schTdSelect(String pro_id) {
		// TODO Auto-generated method stub
		List<ScheduleDTO> schList = mapper.schSelect(pro_id);
		SimpleDateFormat parse = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		for (ScheduleDTO scheduleDTO : schList) {
			try {
				scheduleDTO.setSch_start(format.format(parse.parse(scheduleDTO.getSch_start().substring(0, 10))));
				scheduleDTO.setSch_end(format.format(parse.parse(scheduleDTO.getSch_end().substring(0, 10))));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			scheduleDTO.setTodoList(mapper.tdViewSelect(scheduleDTO.getSch_id()));
		}
		return schList;
	}
	
	@Override
	public List<TodoDTO> tdSelect(String sch_id) {
		// TODO Auto-generated method stub
		return mapper.tdSelect(sch_id);
	}
	
	@Override
	public List<Pro_TeamDTO> proTeamSelect(String pro_id) {
		// TODO Auto-generated method stub
		return mapper.proTeamSelect(pro_id);
	}
	
	@Override
	public List<Sch_TeamDTO> schTeamSelect(String pro_id) {
		// TODO Auto-generated method stub
		return mapper.schTeamSelect(pro_id);
	}
	
	@Override
	public String recentProId(String id) {
		// TODO Auto-generated method stub
		return mapper.recentProId(id);
	}
	
	@Override
	public boolean isLeader(String pro_id, String id) {
		// TODO Auto-generated method stub
		boolean is = false;
		if(mapper.isLeader(pro_id, id)==1) {
			is = true;
		}
		return is;
	}
	
	@Override
	public boolean isSchLeader(String sch_id, String id,String pro_id) {
		// TODO Auto-generated method stub
		boolean is = false;
		try {
			if(mapper.isSchLeader(sch_id, id).equals("1")) {
				mapper.uptSchRend(sch_id);
				mapper.timeendSchedule(pro_id, sch_id);
				is = true;
			}
		}catch (Exception e) {
			// TODO: handle exception
			
		}
		return is;
	}
	
	@Transactional
	@Override
	public void insertSchdule(ScheduleDTO sdto, String pro_id, List<String> sch_team_list) {
		// TODO Auto-generated method stub
		Sch_TeamDTO stDto = new Sch_TeamDTO();
		try {
			sdto.setPro_id(pro_id);
			sdto.setSch_mgr(sch_team_list.get(0));
			mapper.firstInsertSchedule(sdto);
			stDto.setPro_id(pro_id);
			stDto.setId(sdto.getSch_mgr());
			stDto.setSt_level(1);
			mapper.timeInsertSchedule(pro_id, sdto.getSch_name());
			if(sch_team_list!=null) {
				for (String string : sch_team_list) {
					stDto.setId(string);
					mapper.firstInsertSchTeam(stDto);
					stDto.setSt_level(0);	
				}
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	@Override
	public String getTdSchId(String t_id) {
		// TODO Auto-generated method stub
		return mapper.getTdSchId(t_id);
	}
	
	@Override
	public void insertTodo(TodoDTO tdto,String pro_id) {
		// TODO Auto-generated method stub
		mapper.firstInsertTodo(tdto);
		mapper.timeInsertTodo(pro_id,tdto.getT_name());
	}
	
	@Override
	public void uptTdRend(String pro_id,String t_id) {
		// TODO Auto-generated method stub
		mapper.uptTdRend(t_id);
		mapper.timeendTodo(pro_id, t_id);
	}
	
	@Override
	public void uptTdStart(String t_id) {
		// TODO Auto-generated method stub
		mapper.uptTdStart(t_id);
	}
	@Override
	public String sequence_pro_id(ProjectDTO dto) {
		// TODO Auto-generated method stub
		return mapper.sequence_pro_id(dto);
	}
}
