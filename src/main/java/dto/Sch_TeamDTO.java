package dto;

public class Sch_TeamDTO {
	private String pro_id;
	private String id;
	private String name;
	private String profile_img;
	private int st_level;
	private String sch_id;
	private int cntTd;
	private int cntEndTd;
	
	public int getCntEndTd() {
		return cntEndTd;
	}
	public void setCntEndTd(int cntEndTd) {
		this.cntEndTd = cntEndTd;
	}
	public void setCntTd(int cntTd) {
		this.cntTd = cntTd;
	}
	public int getCntTd() {
		return cntTd;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getName() {
		return name;
	}
	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}
	public String getProfile_img() {
		return profile_img;
	}
	public String getPro_id() {
		return pro_id;
	}
	public void setPro_id(String pro_id) {
		this.pro_id = pro_id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getSt_level() {
		return st_level;
	}
	public void setSt_level(int st_level) {
		this.st_level = st_level;
	}
	public String getSch_id() {
		return sch_id;
	}
	public void setSch_id(String sch_id) {
		this.sch_id = sch_id;
	}
	
	
}
