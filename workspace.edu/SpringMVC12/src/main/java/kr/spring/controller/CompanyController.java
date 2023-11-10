package kr.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.entity.tb_company;
import kr.spring.service.CompanyService;

@Controller
@RequestMapping("/company/*")
public class CompanyController {
	
	@Autowired
	private CompanyService companyService;
	
	@RequestMapping("/list")
	public String list(Model model) { // 게시글 전체조회 
		List<tb_company> list = companyService.getList();
		model.addAttribute("list", list);
		return "company/list";
	}
	

	

	

	
	
}







