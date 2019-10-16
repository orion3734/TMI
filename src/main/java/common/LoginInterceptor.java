package common;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import service.ProjectService;
import service.ProjectServiceImp;


public class LoginInterceptor extends HandlerInterceptorAdapter{
	@Autowired
	private ProjectService service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		String uri = request.getRequestURI();
		HttpSession session = request.getSession();
		Enumeration param = request.getParameterNames();
        String strParam = "";
        while(param.hasMoreElements()) {
            String name = (String)param.nextElement();
            String value = request.getParameter(name);
            strParam += name + "=" + value + "&";
        }
        if(request.getParameter("proIdChange") != null && request.getParameter("chg_pro_id") != null) {
        	session.removeAttribute("pro_id");
        	session.setAttribute("pro_id", request.getParameter("chg_pro_id"));
        	response.sendRedirect(uri);
            return false;
        }
		if(session.getAttribute("id") == null) {
			session.setAttribute("returnUri", uri + "?" + strParam);
            response.sendRedirect("/tmi/isGuest");
            return false;
        }else if(session.getAttribute("projectHomeList") == null &&(int)session.getAttribute("grade")!=0) {
        	session.setAttribute("returnUri", uri + "?" + strParam);
        	response.sendRedirect("/tmi/proList");
			return false;
		}
		if(uri.contains("setting") &&session.getAttribute("pro_id") != null) {
			if(uri.contains("main")) {
				return true;
			}
	       	if(!service.isLeader(session.getAttribute("pro_id").toString(), session.getAttribute("id").toString())) {
	       		response.sendRedirect("/tmi/isLeader");
	       		return false;
	       	}	       	
	    }
        return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		// Cache 방지 (2017-10-22)
		if("HTTP/1.1".equals(request.getProtocol())) {
			response.setHeader ("Cache-Control", "no-cache, no-store, must-revalidate");
		} else {
			response.setHeader ("Pragma", "no-cache");
		}
		response.setDateHeader ("Expires", 0);
	}
}
