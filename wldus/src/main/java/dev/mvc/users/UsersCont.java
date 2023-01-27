package dev.mvc.users;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UsersCont {
	@Autowired
	@Qualifier("dev.mvc.users.UsersService")
	private UsersServiceImpl usersService = null;
	
	public UsersCont() {
		
	}
	@RequestMapping(value="/users/read.do", method=RequestMethod.GET)
	public ModelAndView read(int users_no) {
		ModelAndView mav = new ModelAndView();
		
		UsersVO usersVO = this.usersService.read(users_no);
		mav.addObject("usersVO", usersVO);
		mav.setViewName("/users/read");
		return mav;
	}
	
	@RequestMapping(value = "/users/login.do", method = RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("/users/login");
		return mav;
	}

	@RequestMapping(value = "/users/login.do", method = RequestMethod.POST)
	public ModelAndView login_proc(HttpSession session, HttpServletRequest request, String users_id, String users_passwd) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("users_id", users_id);
		map.put("users_passwd", users_passwd);
		
		int count = usersService.login(map); 
		if (count == 1) { 
			UsersVO usersVO = usersService.readById(users_id); 
			session.setAttribute("users_no", usersVO.getUsers_no());
			session.setAttribute("users_id", users_id);
			session.setAttribute("users_name", usersVO.getUsers_name());
			session.setAttribute("users_grade", usersVO.getUsers_grade());

			mav.setViewName("redirect:/index.do"); 
		} else {
			mav.addObject("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");	
			mav.setViewName("/users/login");
	 
		}

		return mav;
	}
	
	@RequestMapping(value = "/users/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		session.invalidate(); 

		mav.addObject("msg", "이용해주셔서 감사합니다.");
		mav.setViewName("/users/msg"); 

		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="/users/checkID.do", method=RequestMethod.GET ,
	                         produces = "text/plain;charset=UTF-8" )
	public String checkID(String users_id) {
	  int cnt = this.usersService.checkID(users_id);
	   
	  JSONObject json = new JSONObject();
	  json.put("cnt", cnt);
	   
	  return json.toString(); 
	}

	@RequestMapping(value="/users/create.do", method=RequestMethod.GET )
	public ModelAndView create() {
	  ModelAndView mav = new ModelAndView();
	  mav.setViewName("/users/create"); 
	  return mav; 
	}
	
	@RequestMapping(value = "/users/create.do", method = RequestMethod.POST)
	public ModelAndView create(UsersVO usersVO) {
		ModelAndView mav = new ModelAndView();
		
		usersVO.setUsers_grade(11);
		int cnt = usersService.create(usersVO);
		
		mav.addObject("cnt", cnt);
		mav.addObject("msg", "회원가입이 완료되었습니다.");
		mav.setViewName("/users/msg");
		return mav;
	}
	
	@RequestMapping(value = "/users/remove.do", method = RequestMethod.GET)
	public ModelAndView remove(HttpServletRequest request, UsersVO usersVO) {
		ModelAndView mav = new ModelAndView();

		int cnt = this.usersService.remove(usersVO);
		if(cnt == 0) {
			String str = usersVO.getUsers_yn();
			String str2 = str.replace("y", "n");
			mav.addObject("str2", str2);
		}
		mav.addObject("cnt", cnt);
		mav.setViewName("redirect:/users/logout.do");
		return mav;
	}
	
	@RequestMapping(value = "/users/msg.do", method = RequestMethod.GET)
	public ModelAndView msg(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String code = req.getParameter("code");

		mav.addObject("msg", code);
		mav.setViewName("/users/msg"); 

		return mav;
	}

}
