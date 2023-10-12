package kr.spring.entity;

import lombok.Data;

@Data  // getter, setter가 필요한 경우 @Data 어노테이션을 달아준다
public class Criteria { // 기준이라는 뜻
	
	private int page; // 현재 페이지 번호를 저장할 변수 (현재 보고있는 페이지)
	
	private int perPageNum; // 한 페이지에 보여줄 게시글의 개수 (한 페이지에 몇 개씩 보여줄 것인지)
	
	// Criteria 생성자를 통해 기본 셋팅
	public Criteria() {
		this.page = 1;
		perPageNum = 10;
	}
	
	// 현재 페이지 게시글의 시작번호를 구하는 메소드
	// 1page -> 1~10 / 2page -> 11~20 / 3page -> 21~30
	// 예외: mysql에서는 시작값을 0으로 인식 -- 1page -> 0~9
	public int getPageStart() { // 몇 번부터 게시글을 시작할 것인지 
		return (page - 1) * perPageNum; // ex) 3page -> 2x10 -> 20~29
		
	}
	
	
}
