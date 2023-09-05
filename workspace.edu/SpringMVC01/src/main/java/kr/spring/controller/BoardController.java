package kr.spring.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.entity.Board;

@Controller // 현재 클래스를 핸들러맵핑이 찾기 위해 컨트롤러로 등록하는 부분
public class BoardController {

//	@RequestMapping("/") // 요청 url로 들어왔을 때 아래 기능을 수행하겠다
//	public String home() {
//		System.out.println("홈기능 수행");
//		return "boardList";
//	}
	@RequestMapping("/boardList.do")   // 요청 url로 들어왔을 때 아래 기능을 수행하겠다
	public String boardList(Model model) {   // 메서드 이름 -> 요청 url 앞 글자를 따와서 지어준다
		System.out.println("게시판목록 보기 기능수행");
		
		// 게시글 정보 가져오기
		// 한 개의 게시글은 - 번호, 제목, 내용, 작성자, 작성일, 조회수
		Board b1 = new Board(1, "오늘 점심 추천 받는다", "짜장면 말고,,", "중국집매니아", "2023-09-05", 5);
		Board b2 = new Board(2, "어제 마지막에 나간 사람 누구임?", "정말 대단하네!", "준용쌤", "2023-09-05", 8);
		Board b3 = new Board(3, "치우야 거기 있는 물건 좀 치우라", "재밌지 ㅋㅋ", "김태연", "2023-09-05", 11);
		Board b4 = new Board(4, "오늘 수업은 오전만 진행합니다", "힝! 속았지?", "명훈쌤", "2023-09-05", 1);
		Board b5 = new Board(5, "오늘까지 해서 우리반 총 7point 획득!", "진짜 5만원 인당 가져가냐 이거?", "병관쌤", "2023-09-05", 4);
		
		ArrayList<Board> list = new ArrayList<Board>();
		list.add(b1);
		list.add(b2);
		list.add(b3);
		list.add(b4);
		list.add(b5);
		
		// 객체바인딩 - 동적바인딩
		model.addAttribute("list", list);
		
		return "boardList"; // /WEB-INF/views/boardList.jsp
	}
	
	
}
