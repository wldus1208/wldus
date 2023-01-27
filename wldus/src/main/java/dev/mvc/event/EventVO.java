package dev.mvc.event;

import org.springframework.web.multipart.MultipartFile;

public class EventVO {
	private int event_no;
	private String id;
	private String arg_Y;
	private String name;
	private String tel;
	private String und_Y;
	private String date;
	
	private int event2_no;
	private String title;
	private String reg_date;
	private String state;
	private int cnt;
    private String file1 = "";
    private String file1saved = "";
    private long size1;
    private String content;
    
    private MultipartFile file1MF;
    private String size1_label = "";
	
	public int getEvent_no() {
		return event_no;
	}
	public void setEvent_no(int event_no) {
		this.event_no = event_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getArg_Y() {
		return arg_Y;
	}
	public void setArg_Y(String arg_Y) {
		this.arg_Y = arg_Y;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getUnd_Y() {
		return und_Y;
	}
	public void setUnd_Y(String und_Y) {
		this.und_Y = und_Y;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	
	public int getEvent2_no() {
		return event2_no;
	}
	public void setEvent2_no(int event2_no) {
		this.event2_no = event2_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getFile1() {
		return file1;
	}
	public void setFile1(String file1) {
		this.file1 = file1;
	}
	public String getFile1saved() {
		return file1saved;
	}
	public void setFile1saved(String file1saved) {
		this.file1saved = file1saved;
	}
	public long getSize1() {
		return size1;
	}
	public void setSize1(long size1) {
		this.size1 = size1;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public MultipartFile getFile1MF() {
		return file1MF;
	}
	public void setFile1MF(MultipartFile file1mf) {
		file1MF = file1mf;
	}
	public String getSize1_label() {
		return size1_label;
	}
	public void setSize1_label(String size1_label) {
		this.size1_label = size1_label;
	}
	
	
}
