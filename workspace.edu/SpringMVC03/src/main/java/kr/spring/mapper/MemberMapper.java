package kr.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;


import kr.spring.entity.Board;
import kr.spring.entity.Member;

@Mapper // MyBatis가 interface를 찾기위해 달아주는 부분
public interface MemberMapper {

	public Member registerCheck(String memID);
	
	
}