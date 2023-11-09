package kr.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.entity.Request;
import kr.spring.service.CollaborationService;
import kr.spring.service.MemberService;

@Controller
@RequestMapping("/collaboration/*")
public class CollaborationController {
	
	@Autowired
	private CollaborationService collaborationService;
	   
	@RequestMapping("/request")
	public String request() {
		return "collaboration/request";
	}

	@PostMapping("/request")
	public String request(Request vo) {
		collaborationService.request(vo);
		return "collation/request";
	}
}
