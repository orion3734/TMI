package dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class TimelineDTO {
	private String tl_id;
	private Date tl_time;
	private String tl_type;
	private String pro_id;
	private String type_id;
	private String tl_info;
	private String tl_content;
	public String getTl_content() {
		return tl_content;
	}
	public void setTl_content(String tl_content) {
		this.tl_content = tl_content;
	}
	public String getTl_id() {
		return tl_id;
	}
	public void setTl_id(String tl_id) {
		this.tl_id = tl_id;
	}
	public Date getTl_time() {
		return tl_time;
	}
	public void setTl_time(Date tl_time) {
		this.tl_time = tl_time;
	}
	public String getTl_type() {
		return tl_type;
	}
	public void setTl_type(String tl_type) {
		this.tl_type = tl_type;
	}
	public String getPro_id() {
		return pro_id;
	}
	public void setPro_id(String pro_id) {
		this.pro_id = pro_id;
	}
	public String getType_id() {
		return type_id;
	}
	public void setType_id(String type_id) {
		this.type_id = type_id;
	}
	public String getTl_info() {
		return tl_info;
	}
	public void setTl_info(String tl_info) {
		this.tl_info = tl_info;
	}
	
	
}
