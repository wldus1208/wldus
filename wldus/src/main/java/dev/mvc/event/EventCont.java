package dev.mvc.event;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.notice.NoticeVO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;


@Controller
public class EventCont {
	@Autowired
	@Qualifier("dev.mvc.event.EventService")
	private EventServiceImpl eventService = null;
	
	public EventCont() {
		
	}
	
	@RequestMapping(value="/event/event.do", method=RequestMethod.GET )
	public String event() {
	      return "/event/event";
	}
	
	@RequestMapping(value = {"/event/tab1.do"}, method = RequestMethod.GET)
	  public String tab1() {
	      return "/event/tab1";
	}
	
	@RequestMapping(value = "/event/tab1.do", method = RequestMethod.POST)
	public ModelAndView insert(EventVO eventVO) {
		ModelAndView mav = new ModelAndView();
		
		int cnt = eventService.insert(eventVO);
		
		mav.addObject("cnt", cnt);
		mav.addObject("msg", "제출되었습니다. 이벤트에 참여해주셔서 감사합니다.");
		mav.setViewName("/users/msg");
		return mav;
	}
	
	@RequestMapping(value = {"/event/tab2.do"}, method = RequestMethod.GET)
	public ModelAndView list() {
	    ModelAndView mav = new ModelAndView();
	    
	    List<EventVO> list = this.eventService.list();
	    mav.addObject("list", list); 
	    mav.setViewName("/event/tab2");
	    return mav;
	  }
	
	@RequestMapping(value = {"/event/tab3.do"}, method = RequestMethod.GET)
	  public String tab3() {
	      return "/event/tab3";
	}
	
	@RequestMapping(value = {"/event/first.do"}, method = RequestMethod.GET)
	  public String first() {
	      return "/event/first";
	}
	
	@RequestMapping(value = {"/event/create.do"}, method = RequestMethod.GET)
	  public String create() {
	      return "/event/create";
	}
	
	@RequestMapping(value = "/event/create.do", method = RequestMethod.POST)
	  public ModelAndView create(HttpServletRequest request, EventVO eventVO) {
	    ModelAndView mav = new ModelAndView();
	    String file1 = "";          
	    String file1saved = "";  

	    String user_dir = System.getProperty("user.dir"); 
	    String upDir =  user_dir + "/src/main/resources/static/event/storage/"; 

	    MultipartFile mf = eventVO.getFile1MF();
	    file1 = Tool.getFname(mf.getOriginalFilename()); 
	    long size1 = mf.getSize();  
	    
	    if (size1 > 0) { 
	      file1saved = Upload.saveFileSpring(mf, upDir); 
	    }    
	    
	    eventVO.setFile1(file1);
	    eventVO.setFile1saved(file1saved);
	    eventVO.setSize1(size1);

	    int cnt = this.eventService.create(eventVO); 
	   
	    if (cnt == 1) {
	        mav.addObject("code", "create_success");
	    } else {
	        mav.addObject("code", "create_fail");
	    }
	    mav.addObject("cnt", cnt); 
	    mav.addObject("url", "/users/msg"); 
	    mav.setViewName("redirect:/users/msg.do"); 
	    
	    return mav; 
	  }
	
	@RequestMapping(value="/event/details.do", method=RequestMethod.GET )
	  public ModelAndView details(int event2_no) {
	    ModelAndView mav = new ModelAndView();
	    
	    EventVO eventVO = this.eventService.details(event2_no);
	    mav.addObject("eventVO", eventVO);
	    mav.setViewName("/event/details");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="/event/delete.do", method=RequestMethod.GET )
	public ModelAndView delete(int event2_no) {
		ModelAndView mav = new ModelAndView();
		EventVO eventVO = this.eventService.details(event2_no);
		mav.addObject("eventVO", eventVO);
		
		int cnt = this.eventService.delete(event2_no);
		mav.addObject("cnt", cnt);

		mav.setViewName("redirect:/event/event.do");
		return mav;
	}
}
