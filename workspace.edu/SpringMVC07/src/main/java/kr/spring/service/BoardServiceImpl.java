package kr.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.entity.Board;
import kr.spring.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardMapper mapper;
	
	@Override // interface 안에 있는 메서드 구현
	public List<Board> getList() {
		// TODO Auto-generated method stub
		
		List<Board> list = mapper.getList();
		return list;
	}

}
