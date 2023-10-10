package kr.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.spring.entity.Book;

@Mapper
public interface BookMapper {
	public List<kr.spring.controller.Book> getLists();

	public void bookInsert(kr.spring.controller.Book vo);
	
	public void bookUpdate(kr.spring.controller.Book vo);

	public void bookDelete(int num);

}
