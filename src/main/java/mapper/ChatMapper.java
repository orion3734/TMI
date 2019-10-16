package mapper;

import java.util.List;

import dto.ChattingDTO;

public interface ChatMapper {
	
	public void insertChat(ChattingDTO dto);
	public List<ChattingDTO> chatList(String pro_id);
	public List<ChattingDTO> dateList(String pro_id);
	public List<ChattingDTO> fileList(String pr_id);
	public String today();
	public void chatUpLoadFile(ChattingDTO dto);
	public ChattingDTO userInfo(String id);
}
