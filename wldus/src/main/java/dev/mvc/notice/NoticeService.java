package dev.mvc.notice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.notice.NoticeService")
public class NoticeService implements NoticeServiceImpl {
	@Autowired
	private NoticeDAO noticeDAO;
	
	public NoticeService() {
		
	}
	
	@Override
	public int create(NoticeVO noticeVO) {
		int cnt = this.noticeDAO.create(noticeVO);
		return cnt;
	}

	@Override
	public List<NoticeVO> list() {
		List<NoticeVO> list = this.noticeDAO.list();
		return list;
	}

	@Override
	public NoticeVO read(int notice_no) {
		NoticeVO noticeVO = this.noticeDAO.read(notice_no);
		return noticeVO;
	}

	@Override
	public int update(NoticeVO noticeVO) {
		int cnt = this.noticeDAO.update(noticeVO);
		return cnt;
	}

	@Override
	public int delete(int notice_no) {
		int cnt = this.noticeDAO.delete(notice_no);
		return cnt;
	}

	@Override
	public int updateCnt(int notice_no) {
		int cnt = this.noticeDAO.updateCnt(notice_no);
		return cnt;
	}

	@Override
	public void Procedure(Map<String, Object> map) {
		this.noticeDAO.Procedure(map);
		
	}

	@Override
	public List<NoticeVO> join() {
		List<NoticeVO> list = this.noticeDAO.join();
		return list;
	}

}
