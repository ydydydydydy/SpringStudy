package kr.spring.mapper; 

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.entity.Board;

@Mapper // MyBatis가 interface를 찾기위해 달아주는 부분(root-context.xml)
public interface BoardMapper {
// BoardMapper interface -> Spring과 MyBatis를 연결
	
//	@Select("SELECT * FROM BOARD ORDER BY INDATE DESC")
	public List<Board> getLists(); // 게시글 전체보기 기능

//	@Insert("INSERT INTO BOARD(TITLE, CONTENT, WRITER) VALUES(#{title}, #{content},#{writer})")
//	BoardMapper.xml 보다 유지보수가 어렵다
	
	public void boardInsert(Board board);

	public Board boardContent(int idx);

	public void boardDelete(int idx);

	public void boardUpdate(Board vo);

	public void boardCount(int idx);
	
}