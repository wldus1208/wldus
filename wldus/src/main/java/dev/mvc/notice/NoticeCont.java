package dev.mvc.notice;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeCont {
	@Autowired
	@Qualifier("dev.mvc.notice.NoticeProc")
	private NoticeProcInter noticeProc;
	
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
		
		int cnt = this.noticeProc.create(noticeVO);
		
		mav.addObject("cnt", cnt);
		mav.setViewName("redirect:/notice/list.do");
		return mav;
	}
	
	@RequestMapping(value="/notice/list.do", method=RequestMethod.GET )
	public ModelAndView list(NoticeVO noticeVO) {
	    ModelAndView mav = new ModelAndView();
	    List<NoticeVO> list = this.noticeProc.list();
	    mav.addObject("list", list);
	    mav.setViewName("/notice/list"); 
	    return mav; 
	}
	
	@RequestMapping(value="/notice/details.do", method=RequestMethod.GET )
	public ModelAndView read(HttpServletRequest request, int notice_no) {
		ModelAndView mav = new ModelAndView();
		List<NoticeVO> list = this.noticeProc.list();
		NoticeVO noticeVO = this.noticeProc.read(notice_no);
		mav.addObject("list", list);
		mav.addObject("noticeVO", noticeVO);
		mav.setViewName("/notice/details");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="/notice/update.do", method=RequestMethod.POST )
	public ModelAndView update(HttpServletRequest request, NoticeVO noticeVO) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("notice_no", noticeVO.getNotice_no());
		
		int cnt = this.noticeProc.update(noticeVO);
		mav.addObject("cnt", cnt);
		mav.addObject("notice_no", noticeVO.getNotice_no());
		mav.setViewName("redirect:/notice/list.do");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="/notice/delete.do", method=RequestMethod.GET )
	public ModelAndView delete(int notice_no) {
		ModelAndView mav = new ModelAndView();
		NoticeVO noticeVO = this.noticeProc.read(notice_no);
		mav.addObject("noticeVO", noticeVO);
		
		int cnt = this.noticeProc.delete(notice_no);
		mav.addObject("cnt", cnt);

		mav.setViewName("redirect:/notice/list.do");
		return mav;
	}
	
}
