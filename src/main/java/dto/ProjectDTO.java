package dto;

import java.util.List;

public class ProjectDTO {
	private int pro_id;
	private String pro_name;
	private String pro_info;
	private String pro_start;
	private String pro_end;
	private String pro_rend;
	private String pro_mgr;
	private String name;
	private List<Pro_TeamDTO> ptList;
	
	
	public void setName(String name) {
		this.name = name;
	}
	public String getName() {
		return name;
	}
	public List<Pro_TeamDTO> getPtList() {
		return ptList;
	}
	public void setPtList(List<Pro_TeamDTO> ptList) {
		this.ptList = ptList;
	}
	public int getPro_id() {
		return pro_id;
	}
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public String getPro_info() {
		return pro_info;
	}
	public void setPro_info(String pro_info) {
		this.pro_info = pro_info;
	}
	public String getPro_start() {
		return pro_start;
	}
	public void setPro_start(String pro_start) {
		this.pro_start = pro_start;
	}
	public String getPro_end() {
		return pro_end;
	}
	public void setPro_end(String pro_end) {
		this.pro_end = pro_end;
	}
	public String getPro_rend() {
		return pro_rend;
	}
	public void setPro_rend(String pro_rend) {
		this.pro_rend = pro_rend;
	}
	public String getPro_mgr() {
		return pro_mgr;
	}
	public void setPro_mgr(String pro_mgr) {
		this.pro_mgr = pro_mgr;
	}
	
	
}
