package kr.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.spring.entity.Board;
import kr.spring.mapper.BoardMapper;

// 앞으로 게시글 관련 요청할 때는 무조건
// /board/하고싶은 기능요청 url
// /board/boardDelete.do

@RequestMapping("/board")
@RestController
public class BoardRestController {

	@Autowired
	private BoardMapper mapper; // MyBatis한테 JDBC를 실행하게 요청하는 객체

	@GetMapping("/all")
	public List<Board> boardList() {
		System.out.println("게시글 전체보기 기능수행");
		List<Board> list = mapper.getLists();
		return list;
	}

	@PostMapping("/new")
	public void boardInsert(Board board) {
		System.out.println("게시글 작성 기능수행");
		mapper.boardInsert(board);
	}

	@GetMapping("/{idx}")
	public Board boardContent(@PathVariable("idx") int idx) {
		Board vo = mapper.boardContent(idx);
		return vo;
	}

	@DeleteMapping("/{idx}")
	public void boardDelete(@PathVariable("idx") int idx) {
		System.out.println("게시글 삭제 기능수행");
		mapper.boardDelete(idx);
	}

	@RequestMapping("/boardUpdate.do")
	public void boardUpdate(Board vo) {
		System.out.println("게시글 수정 기능수행");
		mapper.boardUpdate(vo);
	}

	@RequestMapping("/boardCount.do")
	public void boardCount(@RequestParam("idx") int idx) {
		mapper.boardCount(idx);
	}

}
