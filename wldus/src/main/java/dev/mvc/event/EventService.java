package dev.mvc.event;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.event.EventVO;
import dev.mvc.tool.Tool;

@Component("dev.mvc.event.EventService")
public class EventService implements EventServiceImpl {
	@Autowired
	private EventDAO eventDAO;
	
	public EventService() {
		
	}
	
	@Override
	public int insert(EventVO eventVO) {
		int cnt = this.eventDAO.insert(eventVO);
		return cnt;
	}
	
	@Override
	  public List<EventVO> list() {
	    List<EventVO> list = this.eventDAO.list();
	    return list;
	  }

	@Override
	public int create(EventVO eventVO) {
		int cnt = this.eventDAO.create(eventVO);
		return cnt;
	}

	@Override
	public EventVO details(int event2_no) {
		EventVO eventVO = this.eventDAO.details(event2_no);
		
		String title = eventVO.getTitle();
		String content = eventVO.getContent();
		long size1 = eventVO.getSize1();
		title = Tool.convertChar(title);
		content = Tool.convertChar(content);
		eventVO.setTitle(title);
		eventVO.setContent(content);
		eventVO.setSize1_label(Tool.unit(size1));
		return eventVO;
	}

	@Override
	public int delete(int event2_no) {
		int cnt = this.eventDAO.delete(event2_no);
		return cnt;
	}

	@Override
	public List<EventVO> list_search(Map<String, Object> map) {
		List<EventVO> list = this.eventDAO.list_search(map);
	    return list;
	}

	@Override
	public int search_cnt(Map<String, Object> map) {
		int cnt = this.eventDAO.search_cnt(map);
		return cnt;
	}

	@Override
	public int updateCnt(int event2_no) {
		int cnt = this.eventDAO.updateCnt(event2_no);
		return cnt;
	}

}
