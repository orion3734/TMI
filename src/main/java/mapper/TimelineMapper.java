package mapper;

import java.util.List;

import dto.TimelineDTO;
import dto.TodoDTO;

public interface TimelineMapper {
	public List<TimelineDTO> timeList(String pro_id);
}
