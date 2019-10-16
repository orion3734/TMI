package service;

import java.util.HashMap;
import java.util.List;

import dto.NotiDTO;
import dto.ProjectDTO;
import dto.UserDTO;

public interface UserService {

	//회원가입 insert
	public void insertProcess(UserDTO dto);
	//메일보내기
	public void postmailProcess(UserDTO dto,String subject,String content);
	// 비밀번호찾기 (grade uid 검색)
	public UserDTO find_idProcess(String email);
	//grade 1로변경
	public void update_gradeProcess(String uid);
	//비밀번호 변경
	public void update_pwdProcess(UserDTO dto);
	//uuid 변경
	public void update_uuidProcess(UserDTO dto);
	//로그인 인증
	public UserDTO select_idProcess(UserDTO dto);
	//중복검사
	public int test_idProcess(UserDTO dto);
	public void mypage_update_pwd(UserDTO dto);
	//ip검사
	public String select_ipProcess(String ip);
	
	//ip update
	
	public void update_ipProcess(UserDTO dto);
	
	public void insert_googleProcess(UserDTO dto);
	//email 중복검사
	public int test_emailProcess(UserDTO dto);
	//mypage 계정 update
	public void mypage_updateProcess(UserDTO dto);
	//mypage 내용 불러오는거
	public UserDTO select_mypageProcess(String id);
	
	public String select_id_uuidProcess(String uuid);
	
	public NotiDTO select_notificationProcess(String id,String no);
	
	public int select_noti_countProcess(String id);
	
	public List<HashMap<String, Object>> notifi_listProcess(String id);
	
	public void pro_insertProcess(String id,String pro_id);
	
	public void noti_updateProcess(String state , String pro_id ,String id );
	
	public void noti_insertProcess(NotiDTO dto);
	public void noti_read(NotiDTO dto);
	
	public List<ProjectDTO> mypage_project(String id); 
	public void project_delete(String pro_id);
	public void pro_team_delete(String pro_id);
	public void pro_team_mydelete(String pro_id,String id);
}
