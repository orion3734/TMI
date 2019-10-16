package dto;

public class TodoDTO {
	private String t_id;
	private String t_start;
	private String t_end;
	private int t_priority;
	private String t_name;
	private String t_rend;
	private String sch_id;
	private String id;
	private String start_date;
	private String end_date;
	private String name;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getT_id() {
		return t_id;
	}
	public void setT_id(String t_id) {
		this.t_id = t_id;
	}
	public String getT_start() {
		return t_start;
	}
	public void setT_start(String t_start) {
		this.t_start = t_start;
	}
	public String getT_end() {
		return t_end;
	}
	public void setT_end(String t_end) {
		this.t_end = t_end;
	}
	public int getT_priority() {
		return t_priority;
	}
	public void setT_priority(int t_priority) {
		this.t_priority = t_priority;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	public String getT_rend() {
		return t_rend;
	}
	public void setT_rend(String t_rend) {
		this.t_rend = t_rend;
	}
	public String getSch_id() {
		return sch_id;
	}
	public void setSch_id(String sch_id) {
		this.sch_id = sch_id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
}
