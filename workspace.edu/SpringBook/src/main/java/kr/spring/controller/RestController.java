package kr.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.mapper.BookMapper;

// 앞으로 게시글 관련 요청할 때는 무조건
// /board/하고싶은 기능요청 url
// /board/boardDelete.do

@RequestMapping("/board")


public class RestController {

	@Autowired
	private BookMapper mapper; // MyBatis한테 JDBC를 실행하게 요청하는 객체

	@GetMapping("/all")
	public List<Book> bookList() {
		System.out.println("게시글 전체보기 기능수행");
		List<Book> list = mapper.getLists();
		return list;
	}

	@PostMapping("/new")
	public void bookInsert(Book book) {
		mapper.bookInsert(book);
	}


	@DeleteMapping("/{num}")
	public void bookDelete(@PathVariable("num") int num) {
		mapper.bookDelete(num);
	}

	@PutMapping("/update") //
	public void bookUpdate(@RequestBody Book vo) {
		mapper.bookUpdate(vo);
	}


}
