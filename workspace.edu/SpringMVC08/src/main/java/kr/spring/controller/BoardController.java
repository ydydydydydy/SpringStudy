package kr.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.spring.entity.Board;
import kr.spring.entity.Criteria;
import kr.spring.entity.PageMaker;
import kr.spring.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	private BoardService service;
	// BoardService -> interface로
	// BoardServiceImpl -> BoardService로 업캐스팅 된다
	
	@PostMapping("/reply")
	public String reply(Board vo, Criteria cri, RedirectAttributes rttr) { // 부모글 번호, 작성 ID, 제목, 답글, 작성자 이름
		service.reply(vo);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		return "redirect:/board/list";
	}
	
	@GetMapping("/reply")
	public String reply(@RequestParam("idx") int idx, Model model, @ModelAttribute("cri") Criteria cri) {
		Board vo = service.get(idx); // 답글을 달고싶은 게시글의 정보를 가져옴
		model.addAttribute("vo", vo);
		return "board/reply"; // 답글 게시글 번호
	}
	
	@GetMapping("/remove")
	public String remove(@RequestParam("idx") int idx, Criteria cri, RedirectAttributes rttr) {
		service.remove(idx);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		return "redirect:/board/list";
	}
	
	@PostMapping("/modify")
	public String modify(Board vo, Criteria cri, RedirectAttributes rttr) { // 중복정의 오버로딩
		service.modify(vo);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		return "redirect:/board/list";
	}
	
	@GetMapping("/modify")
	public String modify(@RequestParam("idx") int idx, Model model, @ModelAttribute("cri") Criteria cri) {  // 수정할 게시글의 정보를 가지고 가기 위해 요청
		Board vo = service.get(idx);
		model.addAttribute("vo",vo);
		return "board/modify";
	}
	
	@GetMapping("/get")											 // model.addAttribute(cri)와 같은 역할
	public String get(@RequestParam("idx") int idx, Model model, @ModelAttribute("cri") Criteria cri) {
		Board vo = service.get(idx);
		model.addAttribute("vo", vo);
		return "board/get";
	}
	
	@PostMapping("register")
	public String register(Board vo, RedirectAttributes rttr) {
		// System.out.println(vo.toString());
		service.register(vo);
		// System.out.println(vo.toString());
		rttr.addFlashAttribute("result", vo.getIdx());
		return "redirect:/board/list";
	}
	
	
	@GetMapping("register")
	public String register() {
		return "board/register";
	}

	@GetMapping("/list")
	public String boardList(Model model, Criteria cri) {
		// 이제는 페이지 정보를 알고있는 Criteria 객체를 Service에게 전달
		// 페이징 처리에 필요한 pageMaker 객체도 생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri); // pageMaker가 페이징 기법을 하기위한 cri객체 전달
		pageMaker.setTotalCount(service.totalCount()); // 페이징 기법을 하려면 전체 게시글 개수를 알려줘야함
		
		List<Board> list = service.getList(cri);
		
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
		return "board/list";
	}
	
	
}



