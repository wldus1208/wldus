package dev.mvc.wldus;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeCont {
  public HomeCont() {
    System.out.println("-> HomeCont created.");
  }

  @RequestMapping(value = {"/", "/index.do"}, method = RequestMethod.GET)
  public String home(Locale locale, Model model) {

      return "index";
  }
}
