package dev.mvc.event;

import java.util.List;
import java.util.Map;

public interface EventServiceImpl {
	public int insert(EventVO eventVO);
	public List<EventVO> list();
	public int create(EventVO eventVO);
	public EventVO details(int event2_no);
	public int delete(int event2_no);
	public List<EventVO> list_search(Map<String, Object> map);
	public int search_cnt(Map<String, Object> map);
	public int updateCnt(int event2_no);

}
