package kr.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.entity.Request;

@Controller
@RequestMapping("/collaboration/*")
public class CollaborationController {
	
	@RequestMapping("/request")
	public String request() {
		return "collaboration/request";
	}

	@PostMapping("/request")
	public String request(Request vo) {
		
		return "collation/request";
	}
}
