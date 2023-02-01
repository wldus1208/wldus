package dev.mvc.notice;

import java.util.List;
import java.util.Map;

public interface NoticeServiceImpl {
	public int create(NoticeVO noticeVO);
	public List<NoticeVO> list();
	public NoticeVO read(int notice_no);
	public int update(NoticeVO noticeVO);
	public int delete(int notice_no);
	public int updateCnt(int notice_no);
	public void Procedure(Map<String, Object> map);
	public List<NoticeVO> join();
}
