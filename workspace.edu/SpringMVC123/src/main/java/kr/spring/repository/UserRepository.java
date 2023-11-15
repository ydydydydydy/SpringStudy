package kr.spring.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import kr.spring.entity.tb_user;


public interface UserRepository extends JpaRepository<tb_user, String>{
	

	
	
}
