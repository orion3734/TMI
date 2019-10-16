package service;

import java.util.HashMap;
import java.util.List;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import dto.NotiDTO;
import dto.ProjectDTO;
import dto.UserDTO;
import mail.Mail;
import mapper.UserMapper;
@Service("service")
public class UserServiceImp implements UserService {

	@Autowired
	private UserMapper dao;
	
	public UserServiceImp() {
		// TODO Auto-generated constructor stub
	}
	//회원가입
	@Override
	public void insertProcess(UserDTO dto) {
		// TODO Auto-generated method stub
		dao.insertMethod(dto);
	}
	//이메일에 맞는 grade uuid찾기(비밀번호변경링크보내기위해서)
	@Override
	public UserDTO find_idProcess(String email) {
		// TODO Auto-generated method stub
		return dao.FindEmailMethod(email);
	}
	//grade 1로
	@Override
	public void update_gradeProcess(String uid) {
		// TODO Auto-generated method stub
		dao.UpdateGrade(uid);
	}
	
	//메일보내는거
	@Override
	public void postmailProcess(UserDTO dto,String subject,String content) {
		// TODO Auto-generated method stub
	
	
		String from = "testsemi1112@gmail.com"; // 메일 보내는 사람
		String cc = ""; // 참조
		
		if (from.trim().equals("")) {
			System.out.println("보내는 사람을 입력하지 않았습니다.");
		} else if (dto.getId().trim().equals("")) {
			System.out.println("받는 사람을 입력하지 않았습니다.");
		} else {
			try {
				Mail mt = new Mail();

				// 메일보내기
				mt.sendEmail(from, dto.getId(), cc, subject, content);
				System.out.println("메일 전송에 성공하였습니다.");
			} catch (MessagingException me) {
				me.printStackTrace();
				System.out.println("메일 전송에 실패하였습니다.");
				System.out.println("실패 이유 : " + me.getMessage());
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("메일 전송에 실패하였습니다.");
				System.out.println("실패 이유 : " + e.getMessage());
			}
		}
	}
	//비밀번호변경
	@Override
	public void update_pwdProcess(UserDTO dto) {
		// TODO Auto-generated method stub
		dao.UpdatePwd(dto);
		
	}
	//uuid 변경
	@Override
	public void update_uuidProcess(UserDTO dto) {
		// TODO Auto-generated method stub
		dao.UpdateUuid(dto);
		
	}
	//로그인
	@Override
	public UserDTO select_idProcess(UserDTO dto) {
		// TODO Auto-generated method stub
		return dao.Select_id(dto);
	}
	//중복검사
	@Override
	public int test_idProcess(UserDTO dto) {
		// TODO Auto-generated method stub
		return dao.Test_id(dto);
	}
	//ip 있나확인
	@Override
	public String select_ipProcess(String ip) {
		// TODO Auto-generated method stub
		return dao.Select_ip(ip);
	}
	//새로운지역 ip update
	@Override
	public void update_ipProcess(UserDTO dto) {
		// TODO Auto-generated method stub
		
		dao.Update_ip(dto);
	}
	//구글 회원가입
	@Override
	public void insert_googleProcess(UserDTO dto) {
		// TODO Auto-generated method stub
		
		dao.insert_google(dto);
	}
	@Override
	public int test_emailProcess(UserDTO dto) {
		// TODO Auto-generated method stub
		return dao.Test_email(dto);
	}
	@Override
	public void mypage_updateProcess(UserDTO dto) {
		// TODO Auto-generated method stub
		dao.update_member(dto);
	}
	@Override
	public UserDTO select_mypageProcess(String id) {
		// TODO Auto-generated method stub
		return dao.select_mypage(id);
	}
	@Override
	public String select_id_uuidProcess(String uuid) {
		// TODO Auto-generated method stub
		return dao.select_id_uuid(uuid);
	}
	@Override
	public NotiDTO select_notificationProcess(String id,String no) {
		// TODO Auto-generated method stub
		return dao.select_notification(id,no);
	}
	@Override
	public int select_noti_countProcess(String id) {
		// TODO Auto-generated method stub
		return dao.select_noti_count(id);
	}
	@Override
	public List<HashMap<String, Object>> notifi_listProcess(String id) {
		// TODO Auto-generated method stub
		return dao.notifi_list(id);
	}
	@Override
	public void pro_insertProcess(String id, String pro_id) {
		// TODO Auto-generated method stub
		dao.pro_insert(id, pro_id);
		dao.timeAddMem(id, pro_id);
	}
	@Override
	public void noti_updateProcess(String state, String pro_id, String id) {
		// TODO Auto-generated method stub
		dao.noti_update(state, pro_id, id);
	}
	@Override
	public void noti_insertProcess(NotiDTO dto) {
		// TODO Auto-generated method stub
		dao.noti_insert(dto);
	}
	@Override
	public void noti_read(NotiDTO dto) {
		// TODO Auto-generated method stub
		dao.noti_read(dto);
		
	}
	@Override
	public List<ProjectDTO> mypage_project(String id) {
		// TODO Auto-generated method stub
		return dao.mypage_project(id);
	}
	@Override
	public void project_delete(String pro_id) {
		// TODO Auto-generated method stub
		dao.project_delete(pro_id);
	}
	@Override
	public void pro_team_delete(String pro_id) {
		// TODO Auto-generated method stub
		dao.pro_team_delete(pro_id);
	}
	@Override
	public void pro_team_mydelete(String pro_id, String id) {
		// TODO Auto-generated method stub
		dao.pro_team_mydelete(pro_id, id);
	}
	@Override
	public void mypage_update_pwd(UserDTO dto) {
		// TODO Auto-generated method stub
		dao.mypage_update_pwd(dto);
	}
	
}
