package kr.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	@RequestMapping("/about")
	public String about() {
		return "about";
	}
	
	@RequestMapping("/home")
	public String home() {
		return "index";
	}
//  ajax로 불러오기
   @RequestMapping("/data")
   public String getData() {
       return "main";
   }

}
