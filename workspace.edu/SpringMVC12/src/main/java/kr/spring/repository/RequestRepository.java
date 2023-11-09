package kr.spring.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import kr.spring.entity.Board;
import kr.spring.entity.Company;
import kr.spring.entity.Request;

@Repository // 메모리로 올리기 위한 어노테이션 (생략가능)
public interface RequestRepository extends JpaRepository<Request, String>{
										// <> -> 테이블명, PK 데이터타입

}
















