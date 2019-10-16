package service;

import java.util.List;

import dto.TimelineDTO;
import dto.TodoDTO;

public interface TimelineService {
	public List<TimelineDTO> timeList(String pro_id);
}

