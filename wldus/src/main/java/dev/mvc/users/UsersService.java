package dev.mvc.users;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.users.UsersService")
public class UsersService implements UsersServiceImpl {
	@Autowired
	private UsersDAO usersDAO;
	
	public UsersService() {
		
	}

	@Override
	public int login(HashMap<String, Object> map) {
		int cnt = this.usersDAO.login(map);
		return cnt;
	}

	@Override
	public UsersVO read(int users_no) {
		UsersVO usersVO = this.usersDAO.read(users_no);
		return usersVO;
	}

	@Override
	public UsersVO readById(String users_id) {
		UsersVO usersVO = this.usersDAO.readById(users_id);
		return usersVO;
	}

	@Override
	public int checkID(String users_id) {
		int cnt = this.usersDAO.checkID(users_id);
		return cnt;
	}

	@Override
	public int create(UsersVO usersVO) {
		int cnt = this.usersDAO.create(usersVO);
		return cnt;
	}

	@Override
	public int remove(UsersVO usersVO) {
		int cnt = this.usersDAO.remove(usersVO);
		return cnt;
	}
	
}
