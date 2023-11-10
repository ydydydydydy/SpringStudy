package kr.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.entity.tb_request;
import kr.spring.service.CollaborationService;

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
	public String request(tb_request vo) {
		collaborationService.request(vo);
		return "collation/request";
	}
}
