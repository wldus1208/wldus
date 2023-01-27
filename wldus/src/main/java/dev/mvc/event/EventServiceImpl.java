package dev.mvc.event;

import java.util.List;

public interface EventServiceImpl {
	public int insert(EventVO eventVO);
	public List<EventVO> list();
	public int create(EventVO eventVO);
	public EventVO details(int event2_no);
	public int delete(int event2_no);
}
