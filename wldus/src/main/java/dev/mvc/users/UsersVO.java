package dev.mvc.users;

import org.springframework.web.multipart.MultipartFile;

public class UsersVO {

    private int users_no;
    private String users_id = "";
    private String users_passwd = "";
    private String users_name = "";
    private int users_grade = 0; 
    private String users_gender = "";
    private String users_birth = ""; 
    private String users_tel = "";
    private String users_signdate = "";
    private String users_email = "";
    private String users_yn = ""; 
    private String old_passwd = ""; 
    private String id_save = "";
    private String passwd_save = "";

	public int getUsers_no() {
		return users_no;
	}

	public void setUsers_no(int users_no) {
		this.users_no = users_no;
	}

	public String getUsers_id() {
		return users_id;
	}

	public void setUsers_id(String users_id) {
		this.users_id = users_id;
	}

	public String getUsers_passwd() {
		return users_passwd;
	}

	public void setUsers_passwd(String users_passwd) {
		this.users_passwd = users_passwd;
	}

	public String getUsers_name() {
		return users_name;
	}

	public void setUsers_name(String users_name) {
		this.users_name = users_name;
	}

	public int getUsers_grade() {
		return users_grade;
	}

	public void setUsers_grade(int users_grade) {
		this.users_grade = users_grade;
	}

	public String getUsers_gender() {
		return users_gender;
	}

	public void setUsers_gender(String users_gender) {
		this.users_gender = users_gender;
	}

	public String getUsers_birth() {
		return users_birth;
	}

	public void setUsers_birth(String users_birth) {
		this.users_birth = users_birth;
	}

	public String getUsers_tel() {
		return users_tel;
	}

	public void setUsers_tel(String users_tel) {
		this.users_tel = users_tel;
	}

	public String getUsers_signdate() {
		return users_signdate;
	}

	public void setUsers_signdate(String users_signdate) {
		this.users_signdate = users_signdate;
	}

	public String getUsers_email() {
		return users_email;
	}

	public void setUsers_email(String users_email) {
		this.users_email = users_email;
	}

	public String getUsers_yn() {
		return users_yn;
	}

	public void setUsers_yn(String users_yn) {
		this.users_yn = users_yn;
	}

	public String getOld_passwd() {
		return old_passwd;
	}

	public void setOld_passwd(String old_passwd) {
		this.old_passwd = old_passwd;
	}

	public String getId_save() {
		return id_save;
	}

	public void setId_save(String id_save) {
		this.id_save = id_save;
	}

	public String getPasswd_save() {
		return passwd_save;
	}

	public void setPasswd_save(String passwd_save) {
		this.passwd_save = passwd_save;
	}
    
}