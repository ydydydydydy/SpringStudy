package kr.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.entity.Board;
import kr.spring.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/list")
	public String list(Model model) { // 게시글 전체 조회
		
		List<Board> list = boardService.getList();
		model.addAttribute("list", list);
		return "list";
	}
	
	
}
