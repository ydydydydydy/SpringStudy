package kr.spring.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.entity.Board;
import kr.spring.mapper.BoardMapper;

@Controller // 현재 클래스를 핸들러맵핑이 찾기 위해 컨트롤러로 등록하는 부분
public class BoardController {
		
	@Autowired
	private BoardMapper mapper; // MyBatis한테 JDBC를 실행하게 요청하는 객체

	@RequestMapping("/boardMain.do") // 요청 url로 들어왔을 때 아래 기능을 수행하겠다
	public String home() {
		System.out.println("게시판 페이지 이동 기능수행");
		return "board/main";
	}
	
	
//	@RequestMapping("/boardList.do")
//	public @ResponseBody List<Board> boardList() {
//		System.out.println("게시글 전체보기 기능수행");
//		List<Board> list = mapper.getLists();
//		return list;
//	}
//	
//	@RequestMapping("/boardInsert.do")
//	public @ResponseBody void boardInsert(Board board) {
//		System.out.println("게시글 작성 기능수행");
//		mapper.boardInsert(board);
//	}
//	
//	@RequestMapping("/boardDelete.do")
//	public @ResponseBody void boardDelete(@RequestParam("idx") int idx) {
//		System.out.println("게시글 삭제 기능수행");
//		mapper.boardDelete(idx);
//	}
//	
//	@RequestMapping("/boardUpdate.do")
//	public @ResponseBody void boardUpdate(Board vo) {
//		System.out.println("게시글 수정 기능수행");
//		mapper.boardUpdate(vo);
//	}
//	
//	@RequestMapping("/boardCount.do")
//	public @ResponseBody void boardCount(@RequestParam("idx") int idx) {
//		mapper.boardCount(idx);
//	}
	
}
