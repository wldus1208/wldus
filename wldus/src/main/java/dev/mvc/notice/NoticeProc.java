package dev.mvc.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.notice.NoticeProc")
public class NoticeProc implements NoticeProcInter {
	@Autowired
	private NoticeDAOInter noticeDAO;
	
	public NoticeProc() {
		
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

}
