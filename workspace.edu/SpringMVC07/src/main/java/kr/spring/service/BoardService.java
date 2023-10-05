package kr.spring.service;

import java.util.List;

import kr.spring.entity.Board;

// Service 클래스에서 사용할 기능의 이름을 정의하는 인터페이스(mapper같은 기능)
public interface BoardService {
	
	
	public List<Board> getList();
		
	
	
}
