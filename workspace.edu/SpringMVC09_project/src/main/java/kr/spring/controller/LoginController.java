package kr.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.entity.Member;
import kr.spring.service.BoardService;

@Controller
@RequestMapping("/login/*")
public class LoginController {
	
	@Autowired
	private BoardService service;
	
	@RequestMapping("/logoutProcess")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/board/list";
	}
	
	@RequestMapping("/loginProcess")
	public String login(Member vo, HttpSession session) {
		
		Member mvo = service.login(vo);
		
		if(mvo != null) {
			session.setAttribute("mvo", mvo);
		}
		
		return "redirect:/board/list";
	}
	

}






