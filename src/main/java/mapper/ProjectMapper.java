package mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import dto.NotiDTO;
import dto.Pro_TeamDTO;
import dto.ProjectDTO;
import dto.Sch_TeamDTO;
import dto.ScheduleDTO;
import dto.TodoDTO;

public interface ProjectMapper {
	
	public void firstInsertProject(ProjectDTO pdto);
	public void firstInsertProTeam(Pro_TeamDTO ptDto);
	public void inviteProTeam(NotiDTO nDto);
	public List<HashMap<String, Object>> projectHomeList(String id);
	public List<Integer> proIdList(String id);
	public List<String> searchIdList(String id);
	public List<ProjectDTO> calendarPro(@Param("pro_id") String pro_id,@Param("id") String id);
	public List<ScheduleDTO> calendarSch(String pro_id);
	public List<TodoDTO> calendarTodo(String sch_id);
	public ProjectDTO proSelect(String pro_id);
	public ScheduleDTO schOne(String sch_id);
	public String getTdId(String t_id);
	public String getTdSchId(String t_id);
	public String recentProId(String id);
	public int isLeader(@Param("pro_id") String pro_id,@Param("id") String id);
	public String isSchLeader(@Param("sch_id") String sch_id,@Param("id") String id);
	public String isSchEnd(String sch_id);
	public List<ScheduleDTO> schSelect(String pro_id);
	public List<TodoDTO> tdSelect(String sch_id);
	public List<ScheduleDTO> schSelectEnd(String pro_id);
	public List<TodoDTO> tdSelectEnd(String sch_id);
	public List<TodoDTO> tdViewSelect(String sch_id);
	public List<Pro_TeamDTO> proTeamSelect(String pro_id);
	public List<Sch_TeamDTO> schTeamSelect(String pro_id);
	public List<Sch_TeamDTO> schTeamSelectById(String sch_id);
	public List<TodoDTO> tdProidSelect(String pro_id);
	public List<TodoDTO> tdProidSelectRend(String pro_id); 
	public List<TodoDTO> tdRendCompare(@Param("pro_id") String pro_id,@Param("t_rend") String t_rend);
	public void firstInsertSchedule(ScheduleDTO sdto);
	public void firstInsertSchTeam(Sch_TeamDTO stDto);
	public void firstInsertTodo(TodoDTO tdto);
	public void uptSchRend(String sch_id);
	public void uptTdStart(String t_id);
	public void uptTdRend(String t_id);
	public int cntTodo(@Param("sch_id") String sch_id,@Param("id")String id);
	public int cntEndTodo(@Param("sch_id") String sch_id,@Param("id")String id);
	public void timeInsertTodo(@Param("pro_id") String pro_id,@Param("t_name")String t_name);
	public void timeInsertSchedule(@Param("pro_id") String pro_id,@Param("sch_name")String sch_name);
	public void timeendTodo(@Param("pro_id") String pro_id,@Param("t_id")String t_id);
	public void timeendSchedule(@Param("pro_id") String pro_id,@Param("sch_id")String sch_id);
	public String sequence_pro_id(ProjectDTO dto);
}
