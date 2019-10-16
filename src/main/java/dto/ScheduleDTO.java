package dto;

import java.util.List;

public class ScheduleDTO {
	private String sch_id;
	private String sch_start;
	private String sch_end;
	private String sch_info;
	private String sch_color;
	private String sch_name;
	private String pro_id;
	private String sch_rend;
	private String sch_mgr;
	private List<TodoDTO> todoList;
	private List<Sch_TeamDTO> stList;
	
	
	public List<Sch_TeamDTO> getStList() {
		return stList;
	}
	public void setStList(List<Sch_TeamDTO> stList) {
		this.stList = stList;
	}
	public void setSch_mgr(String sch_mgr) {
		this.sch_mgr = sch_mgr;
	}
	public String getSch_mgr() {
		return sch_mgr;
	}
	public List<TodoDTO> getTodoList() {
		return todoList;
	}
	public void setTodoList(List<TodoDTO> todoList) {
		this.todoList = todoList;
	}
	public String getSch_id() {
		return sch_id;
	}
	public void setSch_id(String sch_id) {
		this.sch_id = sch_id;
	}
	public String getSch_start() {
		return sch_start;
	}
	public void setSch_start(String sch_start) {
		this.sch_start = sch_start;
	}
	public String getSch_end() {
		return sch_end;
	}
	public void setSch_end(String sch_end) {
		this.sch_end = sch_end;
	}
	public String getSch_info() {
		return sch_info;
	}
	public void setSch_info(String sch_info) {
		this.sch_info = sch_info;
	}
	public String getSch_color() {
		return sch_color;
	}
	public void setSch_color(String sch_color) {
		this.sch_color = sch_color;
	}
	public String getSch_name() {
		return sch_name;
	}
	public void setSch_name(String sch_name) {
		this.sch_name = sch_name;
	}
	public String getPro_id() {
		return pro_id;
	}
	public void setPro_id(String pro_id) {
		this.pro_id = pro_id;
	}
	public String getSch_rend() {
		return sch_rend;
	}
	public void setSch_rend(String sch_rend) {
		this.sch_rend = sch_rend;
	}
	
	
}
