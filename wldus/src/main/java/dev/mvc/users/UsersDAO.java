package dev.mvc.users;

import java.util.HashMap;

public interface UsersDAO {
	public UsersVO read(int users_no);  
	public UsersVO readById(String users_id);
	public int login(HashMap<String, Object> map);
	public int checkID(String users_id);
	public int create(UsersVO usersVO);
	public int remove(UsersVO usersVO);
}
