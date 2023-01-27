package dev.mvc.notice;

public class NoticeVO {
	
	private int notice_no;
	private int users_no;
	private String notice_title;
	private String notice_content;
	private String notice_rdate;
	private String updatedate;
	
	public NoticeVO() {
		
	}

	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public int getUsers_no() {
		return users_no;
	}

	public void setUsers_no(int users_no) {
		this.users_no = users_no;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public String getNotice_rdate() {
		return notice_rdate;
	}

	public void setNotice_rdate(String notice_rdate) {
		this.notice_rdate = notice_rdate;
	}

	public String getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}

	@Override
	public String toString() {
		return "NoticeVO [notice_no=" + notice_no + ", users_no=" + users_no + ", notice_title=" + notice_title
				+ ", notice_content=" + notice_content + ", notice_rdate=" + notice_rdate + ", updatedate=" + updatedate
				+ "]";
	}
		

}
