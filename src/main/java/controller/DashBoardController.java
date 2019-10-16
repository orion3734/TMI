package controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import dto.DashDTO;
import dto.UserDTO;
import service.DashBoardService;
import service.UserService;

@Controller
@RequestMapping("/DashBoard/*")
public class DashBoardController {
	
	@Autowired
	private DashBoardService service;
	
	@Autowired
	private UserService uservice;
	
	public void setService(DashBoardService service) {
		this.service = service;
	}
	
	@RequestMapping("/DashMain")
	public ModelAndView DashMain(ModelAndView mav, HttpServletRequest req, HashMap<String, String> map) {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id"); //user_id 
		//int pro_id = Integer.parseInt(req.getParameter("pid"));
		//System.out.println(req.getSession().getAttribute("pro_id") + " : dddd");
		int pro_id = Integer.parseInt((String) req.getSession().getAttribute("pro_id")); // project_id 
		
		map.put("id", id);
		map.put("pro_id", (String) req.getSession().getAttribute("pro_id"));
		
		mav.addObject("pjcnt",service.pjcntProcess(id));
		mav.addObject("alltodocnt", service.AlltodoProcess(id));
		mav.addObject("recnt",service.remaincntProcess(id));
		mav.addObject("comcnt", service.completecntProcess(id));
		
		//donut 그래프
		mav.addObject("donut",service.donutgraphProcess(id));	
		//top5 list
		List<DashDTO> ddto= service.topListProcess(pro_id);
		if(ddto!=null)
		{
		for(int i=0;i<ddto.size();i++)
		{
			DashDTO dadto=new DashDTO();
			dadto.setTotal(ddto.get(i).getTotal());
			UserDTO udto=uservice.select_mypageProcess(ddto.get(i).getId());
		  	dadto.setId(udto.getName());
		  	ddto.set(i, dadto);
			
		}
		}
		mav.addObject("topList",ddto);
		//최근등록 일정
		mav.addObject("relist", service.recentlistProcess(pro_id));
		
		//다가올 일정
		mav.addObject("comlist",service.commingProcess(id));
		//최신 타임라인
		mav.addObject("timelist", service.timelineProcess(id));
		
		
		
		//그래프 추출
		mav.addObject("graphlist", service.graphProcess(map));
		mav.addObject("bg","../resources/Dash_images/"+service.bgViewProcess(id)+".jpg");
		mav.setViewName("DashBoard/DashMain");
		//그냥 메인호출햇을떄도 값 가져와야함
		return mav;
		
	}
	
	@RequestMapping("/DashChange")
	public ModelAndView DashChange(ModelAndView mav, HttpServletRequest req, @RequestParam String bgsel ,DashDTO dto) {
	
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		dto.setBgsel(bgsel);
		dto.setId(id);
		service.bgChange(dto);
		mav.setViewName("redirect:DashMain");
		return mav;
	}
	
}