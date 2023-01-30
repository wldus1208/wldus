package dev.mvc.notice;

import java.util.List;

public interface NoticeDAO {
	public int create(NoticeVO noticeVO);
	public List<NoticeVO> list();
	public NoticeVO read(int notice_no);
	public int update(NoticeVO noticeVO);
	public int delete(int notice_no);
	public int updateCnt(int notice_no);
}
