package mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import dto.NotiDTO;
import dto.ProjectDTO;
import dto.UserDTO;

public interface UserMapper {
    
	//회원가입 insert
	public void insertMethod(UserDTO dto);
	//비밀번호찾기 select
	public UserDTO FindEmailMethod(String email);
	//이메일인증시 1로 upate
	public void UpdateGrade(String uuid);
	//비밀번호변경
	public void UpdatePwd(UserDTO dto);
	//uuidupdate
	public void UpdateUuid(UserDTO dto);
	//로그인 인증
	public UserDTO Select_id(UserDTO dto);
	//중복검사
	public int Test_id(UserDTO dto);
   //ip확인
	public String Select_ip(String ip);
	
	public void Update_ip(UserDTO dto);
	
	public void insert_google(UserDTO dto);	
	//이메일 중복검사
	public int Test_email(UserDTO dto);
	//mypage 계정 update
	public void update_member(UserDTO dto);
	//mypage 내용 불러오는거
	public UserDTO select_mypage(String id);
	
	public String select_id_uuid(String uuid);
	
	public NotiDTO select_notification(@Param("id")String id,@Param("no")String no);
	
	public int select_noti_count(String id);
	
	public List<HashMap<String,Object>> notifi_list(String id);
	
	//pro_team insert
	public void pro_insert(@Param("pro_id") String pro_id,@Param("id") String id);
	public void timeAddMem(@Param("pro_id") String pro_id,@Param("id") String id);
	
	public void noti_update(@Param("state") String state,@Param("pro_id") String pro_id ,@Param("id") String id);
	
	public void noti_insert(NotiDTO dto);
	//읽음 처리
	public void noti_read(NotiDTO dto);
	
	public List<ProjectDTO> mypage_project(String id);
	
	public void project_delete(String pro_id);
	public void pro_team_delete(String pro_id);
	public void pro_team_mydelete(@Param("pro_id")String pro_id,@Param("id")String id);
	public void mypage_update_pwd(UserDTO dto);
}
