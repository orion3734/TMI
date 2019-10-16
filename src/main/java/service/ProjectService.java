package service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import dto.Pro_TeamDTO;
import dto.ProjectDTO;
import dto.Sch_TeamDTO;
import dto.ScheduleDTO;
import dto.TodoDTO;

public interface ProjectService {
	public void insertProject(ProjectDTO pdto, String id, List<String> pro_team_list);
	public List<HashMap<String, Object>> projectHomeList(String id);
	public List<Integer> proIdList(String id);
	public List<String> searchIdList(String id);
	public List<ProjectDTO> calendarPro(String pro_id, String id);
	public List<ScheduleDTO> calendarSchTd(String pro_id);
	public ProjectDTO proSelect(String pro_id);
	public ScheduleDTO schOneSelect(String sch_id);
	public List<ScheduleDTO> schTdSelect(String pro_id);
	public List<TodoDTO> tdSelect(String sch_id);
	public List<Pro_TeamDTO> proTeamSelect(String pro_id);
	public List<Sch_TeamDTO> schTeamSelect(String pro_id);
	public String recentProId(String id);
	public String getTdSchId(String t_id);
	public boolean isLeader(String pro_id, String id);
	public boolean isSchLeader(String sch_id, String id,String pro_id);
	public void uptTdStart(String t_id);
	public void uptTdRend(String pro_id,String t_id);
	public void insertSchdule(ScheduleDTO sdto, String pro_id, List<String> sch_team_list);
	public void insertTodo(TodoDTO tdto,String pro_id);
	public String sequence_pro_id(ProjectDTO dto);
}
