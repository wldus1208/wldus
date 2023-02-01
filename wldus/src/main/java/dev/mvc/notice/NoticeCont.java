package dev.mvc.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import dev.mvc.users.UsersServiceImpl;
import dev.mvc.users.UsersVO;

@Controller
public class NoticeCont {
	@Autowired
	@Qualifier("dev.mvc.notice.NoticeService")
	private NoticeServiceImpl noticeService;
	
	@Autowired
	@Qualifier("dev.mvc.users.UsersService")
	private UsersServiceImpl usersService;
	
	public NoticeCont() {
		
	}
	
	@RequestMapping(value="/notice/create.do", method=RequestMethod.GET )
	public ModelAndView create() {
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("/notice/create"); 
	    return mav; 
	}
	
	@RequestMapping(value="/notice/create.do", method=RequestMethod.POST )
	public ModelAndView create(NoticeVO noticeVO) {
		ModelAndView mav = new ModelAndView();
		
		int cnt = this.noticeService.create(noticeVO);
		
		mav.addObject("cnt", cnt);
		mav.setViewName("redirect:/notice/list.do");
		return mav;
	}
	
//	@RequestMapping(value="/notice/list.do", method=RequestMethod.GET )
//	public ModelAndView list(NoticeVO noticeVO) {
//	    ModelAndView mav = new ModelAndView();
//	    List<NoticeVO> list = this.noticeService.list();
//	    
//	    mav.addObject("list", list);
//	    mav.setViewName("/notice/list"); 
//	    return mav; 
//	}
	
	@RequestMapping(value="/notice/details.do", method=RequestMethod.GET )
	public ModelAndView read(HttpServletRequest request, int notice_no) {
		ModelAndView mav = new ModelAndView();
		
		List<NoticeVO> list = this.noticeService.list();
		NoticeVO noticeVO = this.noticeService.read(notice_no);
//		int cnt = this.noticeService.updateCnt(notice_no);
		Map<String, Object> map = new HashMap();
		HttpSession session = request.getSession();
		String users_id = (String)session.getAttribute("users_id");
		
		map.put("notice_no", notice_no);
		map.put("users_id", users_id);
		
		noticeService.Procedure(map);
		
		mav.addObject("list", list);
		mav.addObject("noticeVO", noticeVO);
		mav.addObject("map", map);
//		mav.addObject("cnt", cnt);
	
		mav.setViewName("/notice/details");
		return mav;
	}
	
	@RequestMapping(value="/notice/details_ajax.do", method=RequestMethod.GET )
    @ResponseBody
    public String details_ajax(int notice_no) {

		NoticeVO noticeVO = this.noticeService.read(notice_no);
          
        JSONObject json = new JSONObject();
        json.put("notice_no", noticeVO.getNotice_no());
        json.put("notice_title", noticeVO.getNotice_title());
        json.put("notice_content", noticeVO.getNotice_content());
        
        return json.toString();
    }
	
	@ResponseBody
	@RequestMapping(value="/notice/update.do", method=RequestMethod.POST )
	public ModelAndView update(HttpServletRequest request, NoticeVO noticeVO) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("notice_no", noticeVO.getNotice_no());
		
		int cnt = this.noticeService.update(noticeVO);
		mav.addObject("cnt", cnt);
		mav.addObject("notice_no", noticeVO.getNotice_no());
		mav.setViewName("/notice/details");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="/notice/delete.do", method=RequestMethod.GET )
	public ModelAndView delete(int notice_no) {
		ModelAndView mav = new ModelAndView();
		NoticeVO noticeVO = this.noticeService.read(notice_no);
		mav.addObject("noticeVO", noticeVO);
		
		int cnt = this.noticeService.delete(notice_no);
		mav.addObject("cnt", cnt);

		mav.setViewName("redirect:/notice/list.do");
		return mav;
	}
	
	@RequestMapping(value="/notice/list.do", method=RequestMethod.GET )
	public ModelAndView list(NoticeVO noticeVO) {
	    ModelAndView mav = new ModelAndView();
	    List<NoticeVO> list = this.noticeService.join();
	    
	    mav.addObject("list", list);
	    mav.setViewName("/notice/list"); 
	    return mav; 
	}
	
}
