package dto;

public class DashDTO {
	private String tl_info; // timeline 글
	private String tl_id; // timeline_id
	private String sch_info; // 다가올일정&최근일정
	private String sch_id; // 다가올일정_id & 최근일정_id
	private String sch_name; // 일정 이름
	private String id; // 작성자
	private String sch_start; // 일정 시작일
	private String sch_end; // 일정 마감일
	private String sch_mgr; //일정 작성자
	private String bgsel; // background color pick
	private String tl_content; //타임라인 내용
	private String tl_type; //타임라인 타입
	private String name; //멤버 이름
	private int total; // top5 list
	private int donut_comp; //도넛그래프 완료
	private int donut_haveto; //해야할 일
	private int donut_bfdead; //마감 임박
	private int donut_afdead; //마감 지남
	private int wk1; //그래프 1주
	private int wk2; //그래프 2주
	private int wk3; //그래프3주
	private int wk4; //그래프4주
	private String pro_id;
	

	public String getPro_id() {
		return pro_id;
	}



	public void setPro_id(String pro_id) {
		this.pro_id = pro_id;
	}



	public DashDTO() {
	}
	
	

	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getTl_type() {
		return tl_type;
	}



	public void setTl_type(String tl_type) {
		this.tl_type = tl_type;
	}



	public String getTl_content() {
		return tl_content;
	}



	public void setTl_content(String tl_content) {
		this.tl_content = tl_content;
	}



	public int getWk1() {
		return wk1;
	}

	public void setWk1(int wk1) {
		this.wk1 = wk1;
	}

	public int getWk2() {
		return wk2;
	}

	public void setWk2(int wk2) {
		this.wk2 = wk2;
	}

	public int getWk3() {
		return wk3;
	}

	public void setWk3(int wk3) {
		this.wk3 = wk3;
	}

	public int getWk4() {
		return wk4;
	}

	public void setWk4(int wk4) {
		this.wk4 = wk4;
	}

	public int getDonut_comp() {
		return donut_comp;
	}


	public void setDonut_comp(int donut_com) {
		this.donut_comp = donut_com;
	}


	public int getDonut_haveto() {
		return donut_haveto;
	}


	public void setDonut_haveto(int donut_haveto) {
		this.donut_haveto = donut_haveto;
	}


	public int getDonut_bfdead() {
		return donut_bfdead;
	}


	public void setDonut_bfdead(int donut_bfdead) {
		this.donut_bfdead = donut_bfdead;
	}


	public int getDonut_afdead() {
		return donut_afdead;
	}


	public void setDonut_afdead(int donut_afdead) {
		this.donut_afdead = donut_afdead;
	}


	public String getSch_mgr() {
		return sch_mgr;
	}


	public void setSch_mgr(String sch_mgr) {
		this.sch_mgr = sch_mgr;
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

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getTl_info() {
		return tl_info;
	}

	public void setTl_info(String tl_info) {
		this.tl_info = tl_info;
	}

	public String getTl_id() {
		return tl_id;
	}

	public void setTl_id(String tl_id) {
		this.tl_id = tl_id;
	}

	public String getSch_info() {
		return sch_info;
	}

	public void setSch_info(String sch_info) {
		this.sch_info = sch_info;
	}

	public String getSch_id() {
		return sch_id;
	}

	public void setSch_id(String sch_id) {
		this.sch_id = sch_id;
	}

	public String getSch_name() {
		return sch_name;
	}

	public void setSch_name(String sch_name) {
		this.sch_name = sch_name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBgsel() {
		return bgsel;
	}

	public void setBgsel(String bgsel) {
		this.bgsel = bgsel;
	}

}
