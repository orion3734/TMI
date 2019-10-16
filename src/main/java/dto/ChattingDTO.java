package dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ChattingDTO {
	private String pro_id;
	private String chat_id;
	private String id;
	private String chat_content;
	private String chat_time;
	private String chat_date;
	private String realfilename;
	private String profile_img;
	private String name;
	private List<MultipartFile> filename;
	private List<String> upload;

	public ChattingDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getPro_id() {
		return pro_id;
	}

	public void setPro_id(String pro_id) {
		this.pro_id = pro_id;
	}

	public String getChat_id() {
		return chat_id;
	}

	public void setChat_id(String chat_id) {
		this.chat_id = chat_id;
	}

	public String getChat_content() {
		return chat_content;
	}

	public void setChat_content(String chat_content) {
		this.chat_content = chat_content;
	}

	public String getChat_time() {
		return chat_time;
	}

	public void setChat_time(String chat_time) {
		this.chat_time = chat_time;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getChat_date() {
		return chat_date;
	}

	public void setChat_date(String chat_date) {
		this.chat_date = chat_date;
	}

	public List<MultipartFile> getFilename() {
		return filename;
	}

	public void setFilename(List<MultipartFile> filename) {
		this.filename = filename;
	}

	public List<String> getUpload() {
		return upload;
	}

	public void setUpload(List<String> upload) {
		this.upload = upload;
	}

	public String getRealfilename() {
		return realfilename;
	}

	public void setRealfilename(String realfilename) {
		this.realfilename = realfilename;
	}

	public String getProfile_img() {
		return profile_img;
	}

	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
