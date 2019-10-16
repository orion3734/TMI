package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dto.ChattingDTO;
import mapper.ChatMapper;
@Service
public class ChatServiceImp implements ChatService{
	@Autowired
	private ChatMapper mapper;
	@Override
	public void insertchat(ChattingDTO dto) {
		mapper.insertChat(dto);
	}
	@Override
	public List<ChattingDTO> chatList(String pro_id){ 
		return mapper.chatList(pro_id);
	}
	@Override
	public List<ChattingDTO> dateList(String pro_id) {
		return mapper.dateList(pro_id);
	}
	@Override
	public String today() {
		return mapper.today();
	}

	@Override
	public List<ChattingDTO> fileList(String pro_id) {
		return mapper.fileList(pro_id);
	}
	@Override
	public void chatUpLoadFile(ChattingDTO dto) {
		mapper.chatUpLoadFile(dto);
	}
	@Override
	public ChattingDTO userInfo(String id) {
		return mapper.userInfo(id);
	}


	
}
