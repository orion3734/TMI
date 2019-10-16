package controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dto.ManageDTO;
import dto.NotiDTO;
import service.ManageService;
import service.UserService;

@Controller
@RequestMapping("/setting/*")
public class ManageController {
	@Autowired
	private ManageService service;
	@Autowired
	private UserService uservice;
	public ManageController() {
		// TODO Auto-generated constructor stub
	}
	
	public void setService(ManageService service) {
		this.service = service;
	}
	
	
	// 프로젝트 관리 메인
	@RequestMapping("/main")
	public ModelAndView main(ModelAndView mav, HttpSession session) {		
		String pro_id= (String) session.getAttribute("pro_id");
		
		mav.addObject("content", service.manageContentProcess(pro_id));
		mav.addObject("people", service.managePeopleProcess(pro_id));
		mav.setViewName("manage/mg_main");
		return mav;
	}
	
	// 프로젝트 설정 페이지
	@RequestMapping("/pjset")
	public ModelAndView pjsetting(ModelAndView mav, String pro_id) {
		mav.addObject("dto", service.manageContentProcess(pro_id));
		mav.setViewName("manage/mg_setting");
		return mav;
	}
	
	// 프로젝트 설정 변경
	@RequestMapping("/contentUpt")
	public String pjupdate(HttpServletRequest request) {
		ManageDTO dto = new ManageDTO();
		dto.setPro_id(request.getParameter("pro_id"));
		dto.setPro_name(request.getParameter("pro_name"));
		dto.setPro_info(request.getParameter("pro_info")); 
		dto.setPro_start(java.sql.Date.valueOf(request.getParameter("pro_start")));
		dto.setPro_end(java.sql.Date.valueOf(request.getParameter("pro_end")));
		
		service.manageContentUpdateProcess(dto);		
				
		return "redirect:/setting/main";
	}
	
	// 멤버 관리 페이지
	@RequestMapping("/setpeople")
	public ModelAndView pjpeople(ModelAndView mav, String pro_id) {		
		mav.addObject("people", service.managePeopleProcess(pro_id));
		
		mav.setViewName("manage/mg_people");
		return mav;
	}
	
	// 매니저 변경
	@RequestMapping("/manager")
	public String pjmanager(String pro_id, String id) {
		service.managerResetProcess(pro_id);
		ManageDTO dto = new ManageDTO();
		dto.setPro_id(pro_id);
		dto.setId(id);
		service.managerChangeProcess(dto);
		service.managerProcess(dto);
		
		return "redirect:/setting/main";
	}
	
	// 멤버 삭제
	@RequestMapping(value="/delete", method=RequestMethod.POST )
	public @ResponseBody List<String> memberDel(@RequestParam(value="pro_id") String pro_id,
			@RequestParam(value="memList[]") List<String> memList) {
		List<String> list = new ArrayList<String>();
		
		for(String mem : memList) {
			ManageDTO dto = new ManageDTO();
			dto.setPro_id(pro_id);
			dto.setId(mem);
			list.add(mem);
			service.memberDelProcess(dto);
		}		
		return list;
	}
	
	// 멤버 추가
	@RequestMapping(value="/addMember", produces="text/plain;charset=UTF-8")	
	public String memberAdd(HttpSession session, @RequestParam(value="pro_team_list", required=false) List<String> pro_team_list) {
		String pro_id= (String) session.getAttribute("pro_id");
		//noti로 insert
		NotiDTO dto= new NotiDTO();
		for(int i=0; i<pro_team_list.size();i++)
		{
			dto.setId(pro_team_list.get(i));
			dto.setPro_id(Integer.valueOf(pro_id));
			dto.setNoti_id((String)session.getAttribute("id"));
			dto.setState(0);
			uservice.noti_insertProcess(dto);
		}
		
		
		
		/*//notification에 insert되야함
		for(String list : pro_team_list) {
			ManageDTO dto = new ManageDTO();
			dto.setPro_id(pro_id);
			dto.setId(list);
			service.memberAddProcess(dto);		
		}*/
		
		return "redirect:/setting/setpeople?pro_id="+pro_id;	
	}
	
	// 추가할 멤버 검색
	@RequestMapping("/searchId")
	public @ResponseBody List<String> searchId(String id) {
		return service.searchIdList(id);
	}
	
	// 추가 멤버 아이디 중복 체크
	@RequestMapping("/idcheck")
	public @ResponseBody String idcheck(String id, HttpSession session) {		
		String pro_id= (String) session.getAttribute("pro_id");
		
		List<String> check = service.idcheckProcess(pro_id);
		for(String chk : check) {
			if(chk.equals(id)) {
				return "1";
			}
		}
		return "0";
	}
	
	// 프로젝트 종료일
	@RequestMapping("/rendSet")
	public String rendSet(HttpSession session) {
		ManageDTO dto = new ManageDTO();
		String pro_id= (String) session.getAttribute("pro_id");
		dto.setPro_id(pro_id);
		
		service.rendSetProcess(dto);
		
		return "redirect:/home";
	}
		
	
}





