package kr.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.mapper.BookMapper;

@Controller
public class BookController {
	@Autowired
	private BookMapper bookMapper;
	
	@RequestMapping("/bookInsert.do")
	public String bookInsert(Book vo) {
		
		bookMapper.bookInsert(vo);
		return "redirect:/bookList.do";
	}
	
	@RequestMapping("/bookUpdate.do")
	public String bookUpdate(Book vo) {
		
		bookMapper.bookUpdate(vo);
		return "redirect:/bookList.do";
	}
	
	@RequestMapping("/bookDelete.do")
	public String bookDelete(int num) {
		return "redirect:/bookList.do";
	}
	
}
