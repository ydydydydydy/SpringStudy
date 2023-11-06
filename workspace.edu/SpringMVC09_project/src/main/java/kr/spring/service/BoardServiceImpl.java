package kr.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.entity.Board;
import kr.spring.entity.Criteria;
import kr.spring.entity.Member;
import kr.spring.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardMapper mapper;

	@Override
	public List<Board> getList(Criteria cri) {
		// 게시글 전체목록 가져오기 기능
		List<Board> list = mapper.getList(cri);
		return list;
	}

	@Override
	public Member login(Member vo) {
		
		Member mvo = mapper.login(vo);
		return mvo;
	}

	@Override
	public void register(Board vo) {
		// TODO Auto-generated method stub
		mapper.insertSelectKey(vo);
	}

	@Override
	public Board get(int idx) {
		// TODO Auto-generated method stub
		Board vo = mapper.read(idx);
		return vo;
	}

	@Override
	public void modify(Board vo) {
		mapper.update(vo);
	}

	@Override
	public void remove(int idx) {
		mapper.delete(idx);
	}

	@Override
	public void reply(Board vo) {
		// TODO Auto-generated method stub
		// 답글 만들기
		// vo - 부모글 번호, 로그인 ID, 제목, 답글, 작성자 이름
		// 부모글의 정보 가져오기
		Board parent = mapper.read(vo.getIdx());
		// 부모글의 boardGroup의 값을 -> 답글 vo에 저장하기
		vo.setBoardGroup(parent.getBoardGroup());
		// 시퀀스와 레벨은 부모글에 + 1
		vo.setBoardSequence(parent.getBoardSequence() + 1);
		vo.setBoardLevel(parent.getBoardLevel() + 1);
		
		// 현재 넣으려는 답글을 제외한 기존 같은 그룹의 댓글의 
		// 시퀀스 값을 1씩 올려줘야한다
		mapper.replySeqUpdate(parent);
		
		// 답변 저장
		mapper.replyInsert(vo);
		
		
	}

	@Override
	public int totalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.totalCount(cri);
	}

}









