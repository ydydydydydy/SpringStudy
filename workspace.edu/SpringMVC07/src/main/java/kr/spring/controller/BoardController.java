package kr.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.entity.Board;
import kr.spring.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	private BoardService service;
	// BoardService -> interface로
	// BoardServiceImpl -> BoardService로 업캐스팅 된다
	
	@RequestMapping("register")
	public String register() {
		return "board/register";
	}
	
	@GetMapping("/list")
	public String boardList(Model model) {	
		List<Board> list = service.getList();
		model.addAttribute("list", list);
		return "board/list";
	}
	
}
