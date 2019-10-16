package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dto.TimelineDTO;
import dto.TodoDTO;
import mapper.TimelineMapper;
@Service
public class TimelineServiceImp implements TimelineService{
	@Autowired
	private TimelineMapper mapper;

	public TimelineServiceImp() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public List<TimelineDTO> timeList(String pro_id) {
		return mapper.timeList(pro_id);
	}

}
