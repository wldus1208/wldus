package dev.mvc.users;

import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	public ModelAndView login(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		Cookie[] cookies = request.getCookies();
	    Cookie cookie = null;

	       String ck_id = ""; 
	       String ck_id_save = ""; 
	       String ck_passwd = ""; 
	       String ck_passwd_save = ""; 

	       if (cookies != null) { 
	         for (int i=0; i < cookies.length; i++){
	           cookie = cookies[i]; 
	           
	           if (cookie.getName().equals("ck_id")){
	             ck_id = cookie.getValue(); 
	           }else if(cookie.getName().equals("ck_id_save")){
	             ck_id_save = cookie.getValue();  
	           }else if (cookie.getName().equals("ck_passwd")){
	             ck_passwd = cookie.getValue();        
	           }else if(cookie.getName().equals("ck_passwd_save")){
	             ck_passwd_save = cookie.getValue();  
	           }
	         }
	       }
	       
	       mav.addObject("ck_id", ck_id);
	       mav.addObject("ck_id_save", ck_id_save);
	       
	       mav.addObject("ck_passwd", ck_passwd);
	       mav.addObject("ck_passwd_save", ck_passwd_save);

		mav.setViewName("/users/login");
		return mav;
	}

	@RequestMapping(value = "/users/login.do", method = RequestMethod.POST)
	public ModelAndView login_proc(HttpSession session, HttpServletRequest request,  HttpServletResponse response, 
			String users_id, String users_passwd, @RequestParam(value="id_save", defaultValue="") String id_save,
            @RequestParam(value="passwd_save", defaultValue="") String passwd_save) {
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
			
			if (id_save.equals("Y")) { 
		        Cookie ck_id = new Cookie("ck_id", users_id);
		        ck_id.setPath("/");  
		        ck_id.setMaxAge(60 * 60 * 24 * 30); 
		        response.addCookie(ck_id);
		      } else { 
		        Cookie ck_id = new Cookie("ck_id", "");
		        ck_id.setPath("/");
		        ck_id.setMaxAge(0);
		        response.addCookie(ck_id); 
		      }
		      
		      Cookie ck_id_save = new Cookie("ck_id_save", id_save);
		      ck_id_save.setPath("/");
		      ck_id_save.setMaxAge(60 * 60 * 24 * 30); 
		      response.addCookie(ck_id_save);
		      
		      if (passwd_save.equals("Y")) { 
		          Cookie ck_passwd = new Cookie("ck_passwd", users_passwd);
		          ck_passwd.setPath("/");
		          ck_passwd.setMaxAge(60 * 60 * 24 * 30);
		          response.addCookie(ck_passwd);
		        } else { 
		          Cookie ck_passwd = new Cookie("ck_passwd", "");
		          ck_passwd.setPath("/");
		          ck_passwd.setMaxAge(0);
		          response.addCookie(ck_passwd);
		        }
		      
		        Cookie ck_passwd_save = new Cookie("ck_passwd_save", passwd_save);
		        ck_passwd_save.setPath("/");
		        ck_passwd_save.setMaxAge(60 * 60 * 24 * 30); 
		        response.addCookie(ck_passwd_save);

			mav.setViewName("redirect:/index.do"); 
		} else {
			mav.addObject("msg", "????????? ?????? ??????????????? ???????????? ????????????.");	
			mav.setViewName("/users/login");
	 
		}

		return mav;
	}
	
	@RequestMapping(value = "/users/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		session.invalidate(); 

		mav.addObject("msg", "?????????????????? ???????????????.");
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
		mav.addObject("msg", "??????????????? ?????????????????????.");
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
