package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.test.annotation.ProfileValueSourceConfiguration;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dto.ProjectDTO;
import dto.ScheduleDTO;
import dto.TodoDTO;
import service.ProjectService;
import service.TimelineService;

@Controller
@RequestMapping("/project/*")
public class ProjectController {
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private TimelineService timeService;
	
	@RequestMapping(value="/management", method=RequestMethod.GET)
	public ModelAndView managementPost(ModelAndView mav) {
		mav.setViewName("project/management");
		return mav;
	}
	
	@RequestMapping(value="/management", method=RequestMethod.POST)
	public ModelAndView managementPost(ModelAndView mav, HttpSession session, @RequestParam(value = "pro_id") String pro_id ,@RequestParam(value = "isEnd",required=false) boolean isEnd) { 
		if(isEnd) {
			session.setAttribute("isEnd", true);
		}else {
			session.removeAttribute("isEnd");
		}
		session.setAttribute("pro_id", pro_id);	
		mav.setViewName("project/management");
		return mav;
	}
	
	@RequestMapping("/kanbanboard")
	public ModelAndView kanbanboard(ModelAndView mav, HttpSession session) {
		String pro_id = session.getAttribute("pro_id").toString();
		mav.addObject("schList",projectService.schTdSelect(pro_id));
		mav.addObject("ptList", projectService.proTeamSelect(pro_id));
		mav.addObject("stList", projectService.schTeamSelect(pro_id));
		mav.setViewName("project/kanbanboard");
		return mav;
	}
	
	@RequestMapping("/calender")
	public ModelAndView calender(ModelAndView mav) {
		mav.setViewName("project/calender");
		return mav;
	}
	
	@RequestMapping("/schedule")
	public ModelAndView scheduleDetail(ModelAndView mav, @RequestParam(required=false) String sch_id, @RequestParam(required=false) String t_id) {
		if(sch_id==null) {
			sch_id = projectService.getTdSchId(t_id);
		}
		mav.addObject("schOne", projectService.schOneSelect(sch_id));
		mav.setViewName("project/schedule");
		return mav;
	}
	
	@RequestMapping("/timeline")
	public ModelAndView ram_timelineTest(ModelAndView mav, HttpSession session) {
		String pro_id = session.getAttribute("pro_id").toString();
		mav.addObject("timelineList", timeService.timeList(pro_id));
		mav.setViewName("project/timeline");
		return mav;
	}
	
	@RequestMapping(value="/insertProject", produces="text/plain;charset=UTF-8")
	public  @ResponseBody String insertProject(ProjectDTO pdto,HttpServletRequest req, @RequestParam(value="pro_team_list", required=false) List<String> pro_team_list) {
		String id = req.getSession().getAttribute("id").toString(); //보낸사람
		String res="";
		projectService.insertProject(pdto,id,pro_team_list);
		//id가     noti_id가 받은사람
				//초대보낸사람  ,프로젝트이름,  첫번쨰 input보낸사람 두번째 input 받은사람 3번째 pro_id
		String pro_id=projectService.sequence_pro_id(pdto);
		res=id+","+pdto.getPro_name()+","+pro_id;
		
		return res;
	}
	
	@RequestMapping("/insertSchedule")
	public String insertSchedule(ScheduleDTO sdto,HttpSession session, @RequestParam(value="sch_team_list") List<String> sch_team_list) {
		String pro_id = session.getAttribute("pro_id").toString();
		projectService.insertSchdule(sdto, pro_id, sch_team_list);
		return "redirect:/project/management";
	}
	
	@RequestMapping("/insertTodo")
	public String insertTodo(TodoDTO tdto,HttpSession session) {
		String pro_id = session.getAttribute("pro_id").toString();
		projectService.insertTodo(tdto,pro_id);
		return "redirect:/project/management";
	}

	@RequestMapping("/showWhat")
	public String showWhat(String where) {
		return "redirect:/project/"+where;
	}
	
	@RequestMapping("/searchId")
	public @ResponseBody List<String> searchId(String id) {
		return projectService.searchIdList(id);
	}
	
	@RequestMapping("/calendarPro")
	public @ResponseBody List<ProjectDTO> calendarPro(HttpSession session) {
		return projectService.calendarPro(session.getAttribute("pro_id").toString(), session.getAttribute("id").toString());
	}
	@RequestMapping("/calendarSchTd")
	public @ResponseBody List<ScheduleDTO> calendarSchTd(HttpSession session) {
		return projectService.calendarSchTd(session.getAttribute("pro_id").toString());
	}
	
	@RequestMapping("/proSelect")
	public @ResponseBody ProjectDTO proSelect(HttpSession session) {
		return projectService.proSelect(session.getAttribute("pro_id").toString());
	}
	
	
	@RequestMapping("/uptTdStart")
	public @ResponseBody void uptTdStart(String t_id) {
		projectService.uptTdStart(t_id);
	}
	
	@RequestMapping("/uptTdRend")
	public @ResponseBody void uptTdRend(String t_id,HttpSession session) {
		String pro_id = session.getAttribute("pro_id").toString();
		projectService.uptTdRend(pro_id,t_id);
	}
	
	@RequestMapping("/schRend")
	public @ResponseBody boolean schRend(String sch_id, HttpSession session) {
		String pro_id = session.getAttribute("pro_id").toString();
		String id = session.getAttribute("id").toString();
		return projectService.isSchLeader(sch_id, id,pro_id);
	}
}
